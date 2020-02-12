class User < ApplicationRecord
    has_many :seasons
    has_many :games, :through => :seasons
    has_secure_password
    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true
    validates :username, length: { minimum: 3 }
    validates :password, length: { in: 6..20 }
    validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }

    def token
        JWT.encode({ user_id: self.id }, ENV['SECRET'])
    end 

end
