class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :token
  # has_many :seasons
end
