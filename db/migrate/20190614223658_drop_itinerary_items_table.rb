class DropItineraryItemsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :itinerary_items
  end
end
