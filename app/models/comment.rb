class Comment < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_many :comments, foreign_key: "parent_id", dependent: :destroy
  validates :place_id, presence: true
end
