class UsersController < ApplicationController
    # before_action :authorized, only: [:reauthorize]

    def create
        @user = User.create(user_params)
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), token: token}
        end
    end

    def index
        @users = User.all
        render json: @users
    end

    def add
        @user = User.find_by(email: params[:email])
        @usertrip = UserTrip.find_by(user_id: @user.id, trip_id: params[:trip_id])
        if @user && !@usertrip
            UserTrip.create(user_id: @user.id, trip_id: params[:trip_id], total_balance: 0, paid:0)
            render json: @user 
        else 
            render json: {error: "No existing User by that email or User already in trip."}
        end
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), token: token}
        else 
            render json: {error: "Authentication Unsucessful"}
        end
    end

    def reauthorize
        render json: {user: UserSerializer.new(current_user)}
    end

    private

    def user_params
        params.permit(:username, :password, :email, :first_name, :last_name, :profile_picture)
    end
end