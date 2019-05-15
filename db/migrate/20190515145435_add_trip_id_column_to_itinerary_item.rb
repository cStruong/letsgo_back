class AddTripIdColumnToItineraryItem < ActiveRecord::Migration[5.2]
  def change
    add_column :itinerary_items, :trip_id, :integer
  end
end
