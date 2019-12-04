class Game < ApplicationRecord
  has_many :user_games
  has_many :reviews
  has_many :game_genres
  has_many :genres, through: :game_genres
  has_many :users, through: :user_games

  def assign_genres(genre_array)
    genre_array.each {|genre_name| 
      genre = Genre.find_by(name: genre_name)
      GameGenre.create(genre_id: genre.id, game_id: self.id)
    }
  end 
end
