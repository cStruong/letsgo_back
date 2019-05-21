class TripsController < ApplicationController
    
    def create
        @trip = Trip.create(trip_params)
        render json: @trip
    end

    def index
        @trips = Trip.all
        render json: @trips
    end

    def show
        @trip = Trip.find_by(id: params[:id])
        render json: @trip
    end

    private

    def trip_params
        params.require(:trip).permit(:admin_id, :destination, :date, :picture_url, :id)
    end
end