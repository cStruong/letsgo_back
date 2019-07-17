class ItineraryItemSerializer < ActiveModel::Serializer
    belongs_to :trip
    
    attributes :id, :name, :trip_id, :link
end
