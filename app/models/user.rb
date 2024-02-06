class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    validates :email, presence: true, email: true, uniqueness: true
    validates :password, password_strength: true, presence: true

    has_one :account, dependent: :destroy
end
