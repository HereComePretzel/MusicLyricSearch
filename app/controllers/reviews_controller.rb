class ReviewsController < ApplicationController
    def index
        @reviews = Review.all 
    end

    def show
        @review = Review.find(params[:id])
        @reviews = Review.all
    end

    def new
        @review = Review.new 
    end

    def create
        @review = Review.create(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        @review.destroy
    end

    private

    def review_params
        params.require(:review).permit(:rating, :user_id, :recording_id, :description)
    end

end
