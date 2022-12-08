class PointsController < ApplicationController
        rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      
        wrap_parameters format: []
        
        def index 
          render json: Point.all, status: :ok
        end
      
        def show 
          point = Point.find(params[:id])
          render json: point, status: :ok
        end
        
        def create 
          point = Point.create!(point_params)
          render json: point, status: :created
        end
      
        def update 
          point = Point.find(params[:id])
          Point.update!(Point_params)
          render json: point, status: :accepted
        end
      
        def destroy
          point = Point.find(params[:id])
          Point.destroy
          render json: {}, status: :ok
        end
      
        private 
      
        def point_params
          params.permit(:name, :image, :note, :user_id, :place_id, :category)
        end
      
        def record_invalid (invalid)
          render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        end
      
        def record_not_found
          render json: { error: "Place not found" }, status: :not_found
        end
      
      end
      

