class AddTripIdColumnToExpenseItem < ActiveRecord::Migration[5.2]
  def change
    add_column :expense_items, :trip_id, :integer
  end
end
