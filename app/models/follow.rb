class Follow < ApplicationRecord
    has_many :followers, foreign_key: 'follower_id', class_name: 'User'
    has_many :followers, foreign_key: 'following_id', class_name: 'User'
end
