class AddPaidColumnWithDefaultToUserTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :user_trips, :paid, :integer, :default => 0
  end
end
