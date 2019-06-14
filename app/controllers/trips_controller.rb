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

    def destroy
        @trip = Trip.find_by(id: params[:id])
        @trip.expense_items.destroy_all
        @trip.user_trips.destroy_all
        @trip.destroy

        render json: @trip
    end

    def yelp
        @response = HTTParty.get("https://api.yelp.com/v3/businesses/search?&location=#{params[:destination]}", 
            headers: { "Content-Type": "application/json",
            "Authorization": "Bearer G7HXvAwE-uHKfDN4qZRFWUouvAaBMPmFVH9RewV11CyfPDCVC-TYABMTlk-jyrFTiaGHLAAy47i67HfCms3jvIQSj0DY3Nr-f1Lb0SHBXn_9tUvt68RQP_e8jdDZXHYx"
        }).body
        
        render json: @response
    end

    private

    def trip_params
        params.require(:trip).permit(:admin_id, :destination, :date, :picture_url, :id)
    end
end