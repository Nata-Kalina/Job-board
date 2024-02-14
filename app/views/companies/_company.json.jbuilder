json.extract! company, :id, :company_title, :about_company, :company_benefits, :company_industry, :company_website, :company_location, :company_email, :company_phone_number, :company_linkedin_profile, :company_facebook_profile, :company_youtube_channel :created_at, :updated_at, :user_id
json.url company_url(company, format: :json)
