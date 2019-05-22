class UserSerializer < ActiveModel::Serializer

    has_many :user_trips
    has_many :trips, through: :user_trips

    attributes :id, :first_name, :last_name, :profile_picture, :email, :username
    
end
