class User < ApplicationRecord
    has_many :seasons
    has_many :games, :through :seasons
end
