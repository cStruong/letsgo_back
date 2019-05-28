class RemoveBalanceAndPaidColumnFromUserTrip < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_trips, :paid
    remove_column :user_trips, :total_balance
  end
end
