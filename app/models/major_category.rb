class MajorCategory < ApplicationRecord
    has_many :categories,
           primary_key: :name, 
           foreign_key: :major_category_name
    
    
    extend DisplayList
    scope :major_category_name_and_id, -> { all.pluck(:name, :id) }
    
    has_one_attached :image
end
