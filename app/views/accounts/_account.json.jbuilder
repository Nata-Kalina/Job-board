json.extract! account, :id, :first_name, :last_name, :user_phone_number, :user_location, :about_user, :user_role, :user_linkedin_profile, :user_website, :created_at, :updated_at, :user_id
json.url account_url(account, format: :json)
