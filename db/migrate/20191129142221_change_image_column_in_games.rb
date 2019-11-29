class ChangeImageColumnInGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :image, :img_url
  end
end
