class Company < ApplicationRecord

    belongs_to :account

    validates :company_title, presence: true
    validates :about_company, presence: true
    validates :company_industry, presence: true
    validates :company_website, presence: true
    validates :company_location, presence: true
    validates :company_email, email: true
    validates :company_phone_number, presence: true, numericality: { only_integer: true }, length: { is: 10 }
    validates :company_linkedin_profile, presence: true
    
    validates_associated :account

    has_many :jobs, dependent: :destroy
end
