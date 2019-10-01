class UsersController < ApplicationController
    # before_action :authorized, only: [:reauthorize]

    def create
        @user = User.create(user_params)
        if @user
            token = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), token: token}
        else 
            errorsArr = []
            @user.errors.messages.each do |key, value|
                value.each do |string|
                    errorsArr.push(string)
                end
            end
            render json: {error: errorsArr}
        end
    end

    def index
        @users = User.all
        render json: @users
    end

    def update
        # aws_credentials = Aws::Credentials.new(
        #     ENV['AWS_ACCESSID'],
        #     ENV['AWS_ACCESSKEY']
        # )

        # s3_bucket = Aws::S3::Resource.new(
        #     region: ENV['AWS_REGION'],
        #     credentials: aws_credentials
        # ).bucket(ENV['AWS_BUCKET'])
        @user = User.find_by(id: params[:id])
        # obj = s3_bucket.object(params[:image_file].original_filename)
        # obj.upload_file(params[:image_file].tempfile, {acl: 'public-read'})
        if @user 
            if params[:first_name] 
                @user.update(first_name: params[:first_name], last_name: params[:last_name])
                render json: @user
            else
                @user.profile_picture = params[:avatar]
                @user.save!
                s3url = @user.profile_picture.url
                @user.update(profile_picture_url: s3url)
                render json: @user
            end
        else
            render json: {error: 'user does not exit'}
        end
    end

    #cannot find usertrip if user doesnt exit add conditional for if user exists then find usertrip
    def add
        @user = User.find_by(email: params[:email])
        if @user 
            @usertrip = UserTrip.find_by(user_id: @user.id, trip_id: params[:trip_id])
            if !@usertrip
                @usertrip = UserTrip.create(user_id: @user.id, trip_id: params[:trip_id], paid:0)
                render json: [@user, @usertrip]
            else 
                render json: {error: ["User already on trip."]}
            end
        else 
            render json: {error: ["No existing User by that email."]}
        end
    end

    def login
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), token: token}
        elsif !@user === true
            render json: {error: ["User does not exist."]}
        elsif @user && @user.authenticate(params[:password]) === false
            render json: {error: ["Wrong password."]}
        else
            render json: {error: ["Login Unsuccessful."]}
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