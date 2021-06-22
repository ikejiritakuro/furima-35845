class RenameDateId < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :date_id, :shopping_day_id
  end
end
