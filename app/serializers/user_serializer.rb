class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :token
end
