class SongsController < ApplicationController

    def index
        @songs = Song.search(params[:search])
        # @recordings = Recording.all
    end 

    def show
        @song = Song.find_by(params[:id])
    end 

    private

    def song_params
        params.require(:song).permit(:name, :lyric, :search)
    end

end
