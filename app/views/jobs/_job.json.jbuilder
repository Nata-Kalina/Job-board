json.extract! job, :id, :job_title, :job_description, :job_company, :job_location, :job_type, :remote, :job_salary, :application_deadline, :published_at, :expiration_date, :job_requirements, :job_responsibilities, :job_benefits, :created_at, :updated_at, :company_id
json.url job_url(job, format: :json)
