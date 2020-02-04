class MapSerializer < ActiveModel::Serializer
  attributes :id, :map, :map_type
  # has_many :games
end
