class PlacesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    wrap_parameters format: []
    
    # skip_before_action :authorize, only: :index
    # skip_before_action :authorize, only: :show
  
    def index 
      render json: Place.all, status: :ok
    end 
  
    def show 
      place = Place.find(params[:id])
      render json: place, status: :ok
    end
  
    def create 
      place = Place.create!(place_params)
      render json: Place, status: :created
    end
    
    def destroy
      place = Place.find(params[:id]).destroy
      render json: {}, status: :ok
   end
  
    private 
  
    def place_params 
      params.permit(:city, :country, :latitude, :longitude)
    end
  
    def record_invalid (invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
  
    def record_not_found
      render json: { error: "Place not found" }, status: :not_found
    end
  
  end
  