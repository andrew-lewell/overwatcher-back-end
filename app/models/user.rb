class User < ApplicationRecord
    has_many :seasons
    has_many :games, :through => :seasons
    has_secure_password
    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true

    def token
        JWT.encode({ user_id: self.id }, ENV['SECRET'])
    end 
end
