class AddLinkColumnToItineraryItems < ActiveRecord::Migration[5.2]
  def change
    add_column :itinerary_items, :link, :string
  end
end
