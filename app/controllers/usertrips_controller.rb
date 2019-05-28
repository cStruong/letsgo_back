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

    def update
        @usertrip = UserTrip.find_by(id: params[:id])
        if @usertrip
            @usertrip.update(paid: params[:paid])
            render json: @usertrip
        else
            render json: {error: 'unable to find that user'}
        end
    end

    def destroy
        
        @usertrip = UserTrip.find_by(id: params[:id])
        @usertrip.destroy

        render json: @usertrips
    end

    private

    def usertrip_params
        params.require(:usertrip).permit(:user_id, :trip_id, :paid, :id)
    end
end