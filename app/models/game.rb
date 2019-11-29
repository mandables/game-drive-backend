class Game < ApplicationRecord
  has_many :user_games
  has_many :reviews
  has_many :game_genres
  has_many :genres, through: :game_genres
  has_many :users, through: :user_games
end
