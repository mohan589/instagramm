class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :pic
    
    validates :user_id, :presence => true
    validates :pic_id, :presence => true
end
