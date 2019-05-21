class UsertripsController < ApplicationController
    
    def create
        @usertrip = UserTrip.create(usertrip_params)
        render json: @usertrip
    end

    def index
        @usertrips = UserTrip.all
        render json: @usertrips
    end

    def show
        @usertrip = UserTrip.find_by(id: params[:id])
        render json: @usertrip
    end

    def destroy
        @usertrip = UserTrip.find_by(id: params[:id])
        @usertrip.destroy

        render json: @usertrips
    end

    private

    def usertrip_params
        params.require(:usertrip).permit(:user_id, :trip_id, :total_balance, :paid, :id)
    end
end