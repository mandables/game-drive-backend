class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :moby_id, :rawg_id
  end
end
