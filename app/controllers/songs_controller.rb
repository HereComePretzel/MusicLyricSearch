class SongsController < ApplicationController

    def index
        @songs = Song.all 
        # @recordings = Recording.all
    end 

    def show
        @song = Song.find_by(params[:id])
    end 


end
