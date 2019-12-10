class GameSerializer < ActiveModel::Serializer
  attributes :id, :rawg_id, :title, :img_url, :users, :reviews
end
