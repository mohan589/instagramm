class Category < ApplicationRecord
    validates :job_category_name, :presence => true
    has_many :current_category_jobs, class_name: 'Job'
end
