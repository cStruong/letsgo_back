class UsertripsController < ApplicationController
    
    def create
        @usertrip = UserTrip.create(usertrip_params)
        render json: @usertrip
    end

    def index
        @usertrips = UserTrip.all
        render json: @usertrips
    end

    private

    def usertrip_params
        params.require(:usertrip).permit(:user_id, :trip_id, :total_balance, :paid)
    end
end