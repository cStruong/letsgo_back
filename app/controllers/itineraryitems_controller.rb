class ItineraryitemsController < ApplicationController
    
    def create
        @itineraryitem = ItineraryItem.create(itineraryitem_params)
        render json: @itineraryitem
    end

    def index
        @itineraryitems = ItineraryItem.all
        render json: @itineraryitems
    end

    private

    def itineraryitem_params
        params.require(:itineraryitem).permit(:trip_id, :name, :estimated_cost)
    end
end