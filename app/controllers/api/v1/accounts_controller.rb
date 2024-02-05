class Api::V1::AccountsController < ApplicationController

    include AuthenticationCheck

    before_action :is_user_logged_in
    before_action :set_account, only: [:show, :update, :destroy]
  
    # GET /accounts
    def index
      @accounts = Account.where(user_id: current_user.id)
      render json: {accounts: @accounts}
    end
  
    # GET /accounts/:id
    def show
      if check_access
        render json: @account, status: 200
      end
    end
  
    # POST /accounts
    def create
      @account = Account.new(account_params)
      @account.user_id = current_user.id
      if @account.save
        render json: @account, status: 201
      else
        render json: { error:
          "Unable to create account: #{@account.errors.full_messages.to_sentence}"},
          status: 400
      end
    end
  
    # PUT /accounts/:id
    def update
      if check_access
        if @account.update(account_params)
            render json: @account, status: 200
        else
            render json: { error:
          "Unable to update account: #{@account.errors.full_messages.to_sentence}"},
          status: 400
        end  

      end
    end
  
    # DELETE /accounts/:id
    def destroy
      if check_access
        @account.destroy
        render json: { message: 'Account record successfully deleted.'}, status: 200
      end
    end
  
    private
  
    def account_params
      params.require(:account).permit(:first_name, :last_name, :user_phone_number, :user_location, :about_user, :user_role, :user_linkedin_profile, :user_website)
    end
  
    def set_account
      @account = Account.find(params[:id])
    end
  
    def check_access
      if (@account.user_id != current_user.id) 
        render json: { message: "The current user is not authorized for that data."}, status: :unauthorized
        return false
      end
      true
    end


end