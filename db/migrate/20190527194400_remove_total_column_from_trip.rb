class RemoveTotalColumnFromTrip < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :total_expense
  end
end
