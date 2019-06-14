class Trip < ApplicationRecord
    has_many :user_trips
    #8
    has_many :itinerary_items
    has_many :users, through: :user_trips
end
