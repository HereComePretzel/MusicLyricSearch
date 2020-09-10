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
 

    def self.api_track_request(search_input)
        response = RestClient.get "https://api.musixmatch.com/ws/1.1/track.search?format=json&callback=callback&q_lyrics=#{search_input}" + ENV["LYRICS_API_KEY"]
        response_hash = JSON.parse(response.body)
        track_array = response_hash["message"]["body"]["track_list"]
        self.api_lyric_request(track_array)
    end
    
    def self.api_lyric_request(track_array)
        track_array.each do |track_hash|
            track = track_hash["track"]
            response = RestClient.get "https://api.musixmatch.com/ws/1.1/track.lyrics.get?format=json&callback=callback&track_id=" + track["track_id"].to_s + ENV["LYRICS_API_KEY"]
            response_hash = JSON.parse(response.body)
            lyrics = response_hash["message"]["body"]["lyrics"]["lyrics_body"]
            self.generate_recording(track, lyrics)
        end

    end

    def self.generate_recording(track, lyrics)
        artist = Artist.find_or_create_by(name: track["artist_name"])
        song = Song.find_or_create_by(name: track["track_name"], lyric: lyrics)
        Recording.find_or_create_by(link: track["track_edit_url"], artist_id: artist.id, song_id: song.id)
    end


    def self.find_recordings_by_lyric_content(search_term)
        self.all.select { |recording| recording.song.lyric.include?(search_term) }
    end

end #end of r class


# iterate through tracks_array to grab tracks ids
# find lyrics through track ids
# response_hash["message"]["body"]["track_list"][0]["track"]["track_id"]
# display lyrics to screen

