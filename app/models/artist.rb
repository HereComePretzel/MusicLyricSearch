class Artist < ApplicationRecord

has_many :recordings
has_many :songs, through: :recordings

end
