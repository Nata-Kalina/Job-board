class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_title
      t.text :about_company
      t.string :company_jobs
      t.string :company_benefits
      t.string :company_industry
      t.string :company_website
      t.string :company_location
      t.string :company_email
      t.integer :company_phone_number
      t.string :company_user_id
      t.string :company_linkedin_profile
      t.string :company_facebook_profile
      t.string :company_youtube_channel

      t.timestamps
    end
  end
end
