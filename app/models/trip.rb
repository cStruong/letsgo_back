class Trip < ApplicationRecord
    has_many :user_trips
    has_many :itinerary_items
    has_many :users, through: :user_trips
end
