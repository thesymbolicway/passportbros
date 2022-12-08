class Point < ApplicationRecord
    has_many :reviews
    belongs_to :user 
    belongs_to :place, optional: true
  
    validates :name, :category, :image, :note, presence: true
end
