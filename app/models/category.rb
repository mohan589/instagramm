class Category < ApplicationRecord
    validates :job_category_name, :presence => true
    has_many :jobs
end
