class ApplicationController < ActionController::API


    def encode_token(payload)
        secret_here = ENV['secret_here']
        JWT.encode(payload, secret_here)
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            secret_here = ENV['secret_here']
            begin
                JWT.decode(token, secret_here, true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'You must be logged in to proceed.'}, status: :unauthorized unless logged_in?
    end

end
