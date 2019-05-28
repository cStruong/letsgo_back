class UserTripSerializer < ActiveModel::Serializer
    
    belongs_to :user
    belongs_to :trip

    attributes :id, :user_id, :trip_id, :paid, :trip
end
