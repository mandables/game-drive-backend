class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :games
end
