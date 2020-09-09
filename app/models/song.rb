class Song < ApplicationRecord

has_many :recordings
has_many :artist, through: :recordings

validates :search, presence: true


    def self.search(search)
        if search
            Song.all.select{|song| song[:lyric].include?(search)}
        elsif search.blank?
            render_404
        end
    end
end
