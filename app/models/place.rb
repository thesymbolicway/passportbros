class Place < ApplicationRecord
    has_many :points
    has_many :users, through: :points
  
    validates :city, :country, :latitude, :longitude, presence: true
end
