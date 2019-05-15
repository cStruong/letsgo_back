class TripsController < ApplicationController
    
    def create
        @trip = Trip.create(trip_params)
        render json: @trip
    end

    def index
        @trips = Trip.all
        render json: @trips
    end

    private

    def trip_params
        params.require(:trip).permit(:admin_id, :destination, :date, :picture_url)
    end
end