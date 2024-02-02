class User < ApplicationRecord
    validates :first_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }, length: { maximum: 255 }, length: { mimimum: 2 }
    validates :last_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }, length: { maximum: 255 }, length: { mimimum: 2 }
    validates :user_phone_number, presence: true
    validates :user_phone_number, numericality: { only_integer: true }
    validates :user_phone_number, length: { is: 10 }
    validates :user_email, presence: true, email: true, uniqueness: true
    validates :user_password, password_strength: true
    validates :user_role, presence: true, inclusion: { in: %w[jobseeker employer admin] }

    has_many :applications, dependent: :destroy
end
