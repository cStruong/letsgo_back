class ItineraryitemsController < ApplicationController
    
    def create
        @itineraryitem = ItineraryItem.create(itineraryitem_params)
        render json: @itineraryitem
    end

    def index
        @itineraryitems = ItineraryItem.all
        render json: @itineraryitems
    end

    def destroy

        @itineraryitem = ItineraryItem.find_by(id: params[:id])
        @itineraryitem.destroy

        render json: @itineraryitem
    end

    private

    def itineraryitem_params
        params.permit(:trip_id, :name, :estimated_cost, :id)
    end
end