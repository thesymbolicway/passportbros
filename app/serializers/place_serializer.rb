class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :city, :country, :latitude, :longitude
end
