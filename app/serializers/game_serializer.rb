class GameSerializer < ActiveModel::Serializer
  attributes :id, :result, :sr, :created_at
  belongs_to :map
  belongs_to :hero
end
