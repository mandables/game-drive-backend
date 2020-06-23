# frozen_string_literal: true

class AddDescriptionToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :description, :string
  end
end
