class Job < ApplicationRecord

    validates :job_title, presence: true, length: {maximum: 50}
    validates :job_description, presence: true
    validates :job_company, presence: true
    validates :application_deadline, presence: true
    validates :published_at, presence: true
    validates :expiration_date, presence: true
    validates :job_requirements, presence: true
    validates :job_responsibilities, presence: true
    validates :salary, presence: true, numericality: { greater_than_or_equal_to: 0 }

    validates_associated :company

    belongs_to :company
end
