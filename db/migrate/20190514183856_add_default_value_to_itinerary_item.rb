class AddDefaultValueToItineraryItem < ActiveRecord::Migration[5.2]
  def change
    change_column :itinerary_items, :estimated_cost, :integer, :default => 0
  end
end
