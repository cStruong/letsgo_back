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
        yelp_api_key_here = ENV['yelp_api_key_here']
        bearer_token = "Bearer " + yelp_api_key_here
        @response = HTTParty.get("https://api.yelp.com/v3/businesses/search?&location=#{params[:destination]}", 
            headers: { "Content-Type": "application/json",
            "Authorization": bearer_token
        }).body
        
        render json: @response
    end

    private

    def trip_params
        params.require(:trip).permit(:admin_id, :destination, :date, :picture_url, :id)
    end
end