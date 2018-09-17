class User < ApplicationRecord
    has_secure_token :auth_token
    has_secure_password
    validates :password, presence: true
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    has_many :questions
    has_many :answers
end
