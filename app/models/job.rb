class Job < ApplicationRecord
    belongs_to :category
    
    validates :title, :presence => true
    validates :description, :presence => true
    validates :exp_required, :presence => true
    validates :category_id, :presence => true
end
