class Song < ApplicationRecord

has_many :recordings
has_many :artist, through: :recordings




def self.search(search)
        if search
            Song.all.select{|song| song[:lyric].include?(search)}
        elsif search.blank?
            puts "Error"
        end
    end
end

