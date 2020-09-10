class SongsController < ApplicationController

    def index
        # @songs = Song.search(params[:search])

        # code below is temporary, testing out API
        @tracks_array = Recording.api_test(params[:search])
        
    end 

    def show
        @song = Song.find_by(params[:id])
    end 

    private

    def song_params
        params.require(:song).permit(:name, :lyric, :search)
    end

end


