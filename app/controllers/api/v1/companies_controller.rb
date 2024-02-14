class Api::V1::CompaniesController < ApplicationController

    include AuthenticationCheck

    before_action :is_user_logged_in
    before_action :set_company, only: [:show, :update, :destroy]
    
    # GET /companies
    def index
      @companies = Company.all
      render json: {companies: @companies}
    end
  
    # GET /companies/:id
    def show
        render json: @company, status: 200
      end
  
    # POST /companies
    def create
      @company = Company.new(company_params)
      @company.user_id = current_user.id
      if @company.save
        render json: @company, status: 201
      else
        render json: { error:
          "Unable to create company: #{@company.errors.full_messages.to_sentence}"},
          status: 400
      end
    end
  
    # PUT /companies/:id
    def update
      if check_access
        if @company.update(company_params)
            render json: @company, status: 200
        else
            render json: { error:
          "Unable to update company: #{@company.errors.full_messages.to_sentence}"},
          status: 400
        end  

      end
    end
  
    # DELETE /companies/:id
    def destroy
      if check_access
        @company.destroy
        render json: { message: 'Company record successfully deleted.'}, status: 200
      end
    end
  
    private
  
    def company_params
      params.require(:company).permit(:company_title, :about_company, :company_jobs, :company_benefits, :company_industry, :company_website, :company_location, :company_email, :company_phone_number, :company_linkedin_profile, :company_facebook_profile, :company_youtube_channel)
    end
  
    def set_company
      @company = Company.find(params[:id])
    end
  
    def check_access
      if (@company.user_id != current_user.id) 
        render json: { message: "The current user is not authorized for that action."}, status: :unauthorized
        return false
      end
      true
    end
  end
