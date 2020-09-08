class Recording < ApplicationRecord

has_many :reviews
has_many :users, through: :reviews
belongs_to :artist
belongs_to :song
end
