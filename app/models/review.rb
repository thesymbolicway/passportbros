class Review < ApplicationRecord
    belongs_to :user
    belongs_to :point

    validates :comment, :rating, presence: true
end
