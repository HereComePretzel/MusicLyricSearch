class User < ApplicationRecord

has_many :reviews
has_many :recordings, through: :reviews

end
