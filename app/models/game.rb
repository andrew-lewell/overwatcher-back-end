class Game < ApplicationRecord
  belongs_to :season
  belongs_to :map
  belongs_to :hero

  validates :result, :sr, presence: true

end
