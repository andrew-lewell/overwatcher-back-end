class Season < ApplicationRecord
  belongs_to :user
  has_many :games
  has_many :maps, through: :games
  has_many :heros, through: :games

  validates :season, presence: true
end
