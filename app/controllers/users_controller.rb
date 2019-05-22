class UsersController < ApplicationController
    # before_action :authorized, only: [:reauthorize]

    def create
        # byebug
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