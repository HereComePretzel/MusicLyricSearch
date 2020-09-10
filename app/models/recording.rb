class Recording < ApplicationRecord

has_many :reviews
has_many :users, through: :reviews
belongs_to :artist
belongs_to :song

require 'rest-client'
require 'json'



#Musix Match api url
$base_url = "https://api.musixmatch.com/ws/1.1/"

#api methods
$lyrics_search = "track.search"
$id_search = "track.lyrics.get"

#format url
$format_url = "?format=json&callback=callback"

#Search parameters 
# q -> Any word in the song title or artist name or lyrics
$search_parameter = "&q="
$id_search_parameter = "&track_id="
 

    def self.api_test(search_input)

        # call = $base_url + $id_search + $format_url + $id_search_parameter + @track_id.to_s + $api_key
        # response = RestClient.get(call)
        if search_input == ""
            return "Invalid input"
        else
            response = RestClient.get "https://api.musixmatch.com/ws/1.1/track.search?format=json&callback=callback&q_lyrics=#{search_input}" + ENV["LYRICS_API_KEY"]
            response_hash = JSON.parse(response.body)
            return tracks_array = response_hash["message"]["body"]["track_list"]
        end
        

    end

    # def lyrics_by_id
    # end


end #end of r class


# iterate through tracks_array to grab tracks ids
# find lyrics through track ids
# response_hash["message"]["body"]["track_list"][0]["track"]["track_id"]
# display lyrics to screen

