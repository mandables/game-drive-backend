# frozen_string_literal: true

class AddTitleToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :title, :text
  end
end
