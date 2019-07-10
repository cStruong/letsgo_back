class AddPaidColumnToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expense_items, :paid, :boolean, :default => false
  end
end
