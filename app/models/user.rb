class User < ApplicationRecord
    has_secure_password
    has_many :user_trips
    has_many :trips, through: :user_trips
    mount_uploader :profile_picture, AvatarUploader

    validates :username, presence: { message: "Username field cannot be blank." }
    validates :username, uniqueness: { message: "This username is already in use." }
    validates_length_of :username, :maximum => 20, :message => "Username must be less than 20 characters."

    # validates :password, presence: {message: "Password field cannot be blank."}

    validates :email, presence: { message: "Email field cannot be blank." }
    validates :email, uniqueness: {message: "This email is already in use." }

    validates :first_name, presence: {message: "First Name field cannot be blank."}
    validates_length_of :first_name, :maximum => 20, :message => "First Name must be less than 20 characters."
    
    validates :last_name, presence: {message: "Last Name field cannot be blank."}
    validates_length_of :last_name, :maximum => 20, :message => "Last Name must be less than 20 characters."

end
