class RecordingsController < ApplicationController

    def show
        @recording = Recording.find(params[:id])
    end

    def search
        @searched_recordings = []
        if params[:search] != ""
            Recording.api_track_request(params[:search])
            @searched_recordings = Recording.find_recordings_by_lyric_content(params[:search])
        end 

        render :search
    end


end



