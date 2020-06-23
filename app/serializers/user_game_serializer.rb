# frozen_string_literal: true

class UserGameSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :game_id, :played?
end
