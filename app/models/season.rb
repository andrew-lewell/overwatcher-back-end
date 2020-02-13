class Season < ApplicationRecord
  belongs_to :user
  has_many :games, -> { order('created_at DESC') }
  has_many :maps, through: :games
  has_many :heros, through: :games

  validates :season, presence: true
end
