class User < ApplicationRecord
    # has_secure_password
    
    has_many :points
    has_many :places, through: :points
    has_many :reviews
  
    validates :username, presence: :true, uniqueness: :true
    validates :password, :profile_image, :first_name, :last_name, presence: :true

    has_secure_password
end
