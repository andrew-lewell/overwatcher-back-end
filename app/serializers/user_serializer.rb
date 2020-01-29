class UserSerializer < ActiveModel::Serializer
  attributes :username, :token
end
