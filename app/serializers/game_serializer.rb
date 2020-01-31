class GameSerializer < ActiveModel::Serializer
  attributes :id, :result, :sr
  belongs_to :map
  belongs_to :hero
end
