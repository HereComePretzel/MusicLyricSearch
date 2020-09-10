class Song < ApplicationRecord

has_many :recordings
has_many :artist, through: :recordings


    # def self.search(search)
    #     if search == ""
    #         return []
    #     else
    #         Song.all.select{|song| song[:lyric].downcase.include?(search.downcase)}
    #     end
    # end

end #end of song Class

