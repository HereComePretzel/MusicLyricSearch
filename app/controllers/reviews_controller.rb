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
        @user = User.find_by(id: session[:user_id])
        @user.my_reviews << Review.create(review_params)
        
        redirect_to home_path
    end

    def destroy
        @review.destroy
    end

    private

    def review_params
        params.require(:review).permit(:rating, :description, :recording_id)
    end

end
