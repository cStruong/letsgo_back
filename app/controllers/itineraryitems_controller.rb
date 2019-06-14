class ItineraryitemsController < ApplicationController
    #1 <change tab name + class name 
    def create
        #2
        @itineraryitem = ItineraryItem.create(itineraryitem_params)
        render json: @itineraryitem
    end

    def index
        #3
        @itineraryitems = ItineraryItem.all
        render json: @itineraryitems
    end

    def destroy
        #4
        @itineraryitem = ItineraryItem.find_by(id: params[:id])
        @itineraryitem.destroy

        render json: @itineraryitem
    end

    private
        #5
    def itineraryitem_params
        params.permit(:trip_id, :name, :estimated_cost, :id)
    end
end