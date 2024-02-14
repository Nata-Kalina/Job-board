class Api::V1::JobsController < ApplicationController

    include AuthenticationCheck

    before_action :is_user_logged_in
    before_action :set_job, only: [:show, :update, :destroy]
  
    # GET /jobs
    def index
        @jobs = Job.all
        render json: {jobs: @jobs}
    end


    # GET /jobs/:id
    def show
      @job.update(views: @job.views + 1)
      render json: @job, status: 200

    end
  
    # POST /companies/:company_id/jobs
    def create
        @company = Company.find(params[:company_id])
        @job = @company.jobs.new(job_params)
        @job.company_id = @company.id
      if @job.save
        render json: @job, status: 201
      else
        render json: { error: 
         "The job entry could not be created. #{@job.errors.full_messages.to_sentence}"},
        status: 400
      end
    end
  
    # PUT /companies/:company_id/jobs/:id
    def update
      @company = Company.find(params[:company_id])
      if @company.id != @job.company_id
        render json: { message: "The current user is not authorized for that action."}, status: :unauthorized
      else
        if @job.update(job_params)
          render json: @job, status: 200
        else
          render json: { error: "Unable to update job: #{@job.errors.full_messages.to_sentence}"}, status: 400
        end 
      end
    end   
      
    # DELETE /company/:company_id/jobs/:id
    def destroy
      @company = Company.find(params[:company_id])
      if @company.id != @job.company_id
        render json: { message: "The current user is not authorized for that action."}, status: :unauthorized
      else
            @job.destroy
            render json: { message: 'Job record successfully deleted.'}, status: 200
       end
      end
  
    private
  
    def job_params
      params.require(:job).permit(:job_title, :job_description, :job_company, :company_id, :job_location, :job_type, :job_salary, :application_deadline, :published_at, :expiration_date, :job_requirements, :job_responsibilities, :job_benefits, :associated_used_id, :job_category_id, :views_count, :applications_count)
    end
  
    def set_job
      @job = Job.find_by(id: params[:id])
    end

    
end
