class RecordingsController < ApplicationController

    def show
        @recording = Recording.find_by(params[:id])
    end 
end
