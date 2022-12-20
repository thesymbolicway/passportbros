class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    wrap_parameters format: []
  
    skip_before_action :authorize, only: :specific_point
  
   
    def index 
      render json: Review.all, status: :ok
    end 

    def specific_point 
      render json: Review.where(point_id: params[:point_id]), status: :ok
    end

    def show 
      review = Review.find(params[:id])
      render json: review, status: :ok
    end
  
    def create 
      review = Review.create!(review_params)
      render json: review, status: :created
    end
  
    def update 
      review = Review.find(params[:id])
      Review.update!(review_params)
      render json: review, status: :accepted
    end
  
    def destroy
      review = Review.find(params[:id]).destroy
      render json: {}, status: :ok
   end
  
    private 
  
    def review_params 
      params.permit(:comment, :rating, :user_id, :point_id)
    end
  
    def record_invalid (invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
  
    def record_not_found
      render json: { error: "Review not found" }, status: :not_found
    end
  
  end
  
