class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rating, :user_id, :point_id
end
