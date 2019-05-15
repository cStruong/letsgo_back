class UsersController < ApplicationController
    
    def create
        @user = User.create(user_params)
        render json: @user
    end

    def index
        @users = User.all
        render json: @users
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :profile_picture)
    end
end