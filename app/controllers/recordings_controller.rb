class RecordingsController < ApplicationController

    def index
        @recordings = Recording.all 
    end 

    def show
        @recording = Recording.find_by(params[:id])
    end 
end
