class CreateItineraryItemsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_items do |t|
      t.string :name
      t.integer :trip_id
    end
  end
end
