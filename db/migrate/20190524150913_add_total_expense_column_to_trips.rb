class AddTotalExpenseColumnToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :total_expense, :integer, :default => 0
  end
end
