class User < ApplicationRecord
    has_secure_password
    has_many :user_trips
    has_many :trips, through: :user_trips

    validates :username, presence: { message: "Username field cannot be blank." }
    validates :username, uniqueness: { message: "This username is already in use." }
    # validates :username, length: { maximum: 20 }, message: "Must be less than 20 characters."

    validates :password, presence: {message: "Password field cannot be blank."}

    validates :email, presence: { message: "Email field cannot be blank." }
    validates :email, uniqueness: {message: "This email is already in use." }

    validates :first_name, presence: {message: "First Name field cannot be blank."}
    # validates :first_name, length: { maximum: 20 }, message: "Must be less than 20 characters."
    
    validates :last_name, presence: {message: "Last Name field cannot be blank."}
    # validates :last_name, length: { maximum: 20 }, message: "Must be less than 20 characters."

end
