class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    validates :email, presence: true, email: true, uniqueness: true
    validates :password, password_strength: true, presence: true

    has_many :account, dependent: :destroy
end
