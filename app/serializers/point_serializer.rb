class PointSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :note, :user_id, :place_id, :category
end
