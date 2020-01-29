class Game < ApplicationRecord
  belongs_to :season
  belongs_to :map
  belongs_to :hero

end
