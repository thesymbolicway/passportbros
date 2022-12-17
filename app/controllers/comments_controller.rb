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
        # Use the comment instance variable instead of the Comment class
        comment = Comment.find(params[:id])
        comment.update!(comment_params)
        render json: comment, status: :accepted
    end

    def destroy
        # Save the return value of the destroy method to the comment instance variable
        comment = Comment.destroy(params[:id])
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