class Application < ApplicationRecord
    belongs_to :account

    validates :resume_attachment, presence: true
    validates :status, presence: true, inclusion: { in: %w[applied received pending incomplete accepted rejected] }
    validates_associated :account

end
