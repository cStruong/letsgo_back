class UsersController < ApplicationController
    before_action :authorized

    def create
        @user = User.create(user_params)
        render json: @user
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

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :profile_picture)
    end
end