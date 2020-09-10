class User < ApplicationRecord

has_many :reviews
has_many :recordings, through: :reviews
has_secure_password 
end
