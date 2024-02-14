json.extract! application, :id, :resume_attachment, :cover_letter, :status, :applied_at, :notes, :created_at, :updated_at, :account_id, :job_id
json.url application_url(application, format: :json)
