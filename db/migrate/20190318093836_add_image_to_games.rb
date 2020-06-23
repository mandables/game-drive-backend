# frozen_string_literal: true

class AddImageToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :image, :text
  end
end
