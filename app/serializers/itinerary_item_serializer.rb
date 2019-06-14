class ItineraryItemSerializer < ActiveModel::Serializer
    belongs_to :trip
    # 9 tab and classname
    attributes :id, :name, :estimated_cost, :trip_id
end
