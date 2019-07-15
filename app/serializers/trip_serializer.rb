class TripSerializer < ActiveModel::Serializer

    has_many :user_trips
    has_many :expense_items
    has_many :itinerary_items
    has_many :users, through: :user_trips

    attributes :id, :admin_id, :destination, :date, :picture_url
    
end