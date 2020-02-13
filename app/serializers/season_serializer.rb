class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :season
  belongs_to :user
  has_many :games 

end
