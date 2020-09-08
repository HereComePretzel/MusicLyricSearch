class Song < ApplicationRecord

has_many :recordings
has_many :artist, through: :recordings
end
