class CommentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    wrap_parameters format: []
  
    # skip_before_action :authorize, only: :specific_point
  
     
    def index 
        render json: Comment.all, status: :ok
      end 
  
      def specific_point 
        render json: Comment.where(point_id: params[:point_id]), status: :ok
      end
  
      def show 
        comment = Comment.find(params[:id])
        render json: comment, status: :ok
      end
    
      def create 
        comment = Comment.create!(comment_params)
        render json: comment, status: :created
      end
    
      def update 
        comment = Comment.find(params[:id])
        Comment.update!(comment_params)
        render json: comment, status: :accepted
      end
    
      def destroy
        comment = Comment.find(params[:id]).destroy
        render json: {}, status: :ok
     end
    
      private 
    
      def comment_params 
        params.permit(:body, :user_id, :place_id)
      end
    
      def record_invalid (invalid)
        render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
      end
    
      def record_not_found
        render json: { error: "Comment not found" }, status: :not_found
      end
    
    end