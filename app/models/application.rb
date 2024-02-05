class Application < ApplicationRecord

    validates :resume_attachment, presence: true
    validates :status, presence: true
    validates :applied_at, presence: true
    validates :associated_job_id, presence: true
    validates :applicant_id, presence: true
    validates :status, inclusion: { in: %w[pending accepted rejected] }

    validates_associated :user
    validates_associated :job

    belongs_to :user
    belongs_to :job
end
