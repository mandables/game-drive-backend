class User < ApplicationRecord
    has_many :user_games
    has_many :reviews 
    has_many :games, through: :user_games 
    has_secure_password
end
