class Trip < ApplicationRecord
    has_many :user_trips
    has_many :expense_items
    has_many :itinerary_items
    has_many :users, through: :user_trips

    validates :destination, presence: {message: 'Requires a destination.'}
    validates :date, presence: {message: 'Requires a date.'}
end
