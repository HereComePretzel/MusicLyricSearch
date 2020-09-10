class User < ApplicationRecord
has_many :my_reviews, foreign_key: "user_id", class_name: "Review"
has_many :reviews
has_many :recordings, through: :reviews
has_secure_password 
end
