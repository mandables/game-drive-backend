class GameSerializer < ActiveModel::Serializer
  attributes :id, :moby_id, :title, :image, :users, :reviews
end
