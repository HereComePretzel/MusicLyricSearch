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
        @rec_id = session[:rec_id]
        @review_recording = Recording.find(@rec_id)
    end

    def create
        @user = User.find_by(id: session[:user_id])

        @rec_id = session[:rec_id]
        @new_review = Review.create(review_params)


       # Review.create(rating: 1, user_id: @user_id, recording_id:  @rec_id, description: "The Beach Boys are a revelation.")

        params[:recording_id] = @rec_id
 
        @user.my_reviews << @new_review
         
    
        redirect_to recording_path(@rec_id)
    end


    # def create
    #     @user = User.find_by(id: session[:user_id])
    #     @rec_id = session[:rec_id]
    #     @new_review = Review.create(review_params)
    #     params[:recording_id] = @rec_id
    #     @user.my_reviews << @new_review
    #     redirect_to recording_path(@new_review.recording)
    # end



    def destroy
        @review.destroy
    end

    private

    def review_params
        params.require(:review).permit(:rating, :description, :recording_id)
    end

end
