# frozen_string_literal: true

class GameGenreSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :user_id
end
