class Song < ApplicationRecord

has_many :recordings
has_many :artist, through: :recordings

    def lyric_with_line_breaks
        self.lyric.gsub(/\n/, '<br>')
    end
end

