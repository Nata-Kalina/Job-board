class Api::V1::ApplicationsController < ApplicationController

    include AuthenticationCheck

    before_action :is_user_logged_in
    before_action :set_account
    before_action :set_application, only: [:show, :update, :destroy]
    before_action :check_access
   
    # GET /accounts/:account_id/applications
    def index
        @account = Account.find(params[:account_id])
        render json: @account.applications
    end
  
    # GET /accounts/:account_id/applications/:id
    def show
      render json: @application, status: 200
    end
  
    # POST /accounts/:account_id/applications
    def create
        @account = Account.find(params[:account_id])
        @application = @account.applications.new(application_params)
        @application.account_id = @account.id
        if @application.save
          render json: @application, status: 201
        else
          render json: { error:
            "Unable to create application: #{@application.errors.full_messages.to_sentence}"},
            status: 400
        end
    
    end
  
    # PUT /accounts/:account_id/applications/:id
    def update
      if @application.update(application_params)
        render json: @application, status: 200
      else
        render json: { error: 
  "The application record could not be updated. #{@application.errors.full_messages.to_sentence}"},
        status: 400
      end
    end
  
    # DELETE /accounts/:account_id/applications/:id
    def destroy
        if @application.destroy
            render json: { message: 'Application record successfully deleted.'}, status: 200
        else
            render json: { error: 
  "The application record could not be deleted. #{@application.errors.full_messages.to_sentence}"},
        status: 400
        end
    end
  
    private
  
    def application_params
      params.require(:application).permit(:resume_attachment, :cover_letter, :status, :applied_at, :notes, :associated_job_id, :applicant_id)
    end
  
    def set_application
      @application = Application.find_by(id: params[:id])
    end

    def set_account
      @set_account = Account.find_by(id: params[:account_id])
    end

    def check_access 
      @account = Account.find(params[:account_id])
      if @account.user_id != current_user.id
        render json: { message: "The current user is not authorized for that action."}, status: :unauthorized
      end
    end
    
end
