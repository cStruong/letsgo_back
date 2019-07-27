class ItineraryItem < ApplicationRecord
    belongs_to :trip

    validates :name, presence: {message: 'Activity cannot be blank.'}
end
