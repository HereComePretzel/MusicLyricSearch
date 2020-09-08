class WelcomesController < ApplicationController

    def new
        @song = Song.new
        @songs = Song.all 
    end 

    def create
        @song = Song.create(params[:id])
        redirect_to song_path(@song)
    end 

end
