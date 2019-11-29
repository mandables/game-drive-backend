class ChangeUserIdInGameGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :game_genres, :user_id, :genre_id
  end
end
