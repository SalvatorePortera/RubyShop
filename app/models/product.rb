class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  acts_as_likeable
  has_one_attached :image

  extend DisplayList
  scope :on_category, -> (category) { where(category_id: category) }
   scope :sort_order, -> (order) { order(order) }
 
   scope :category_products, -> (category, page) { 
     on_category(category).
     display_list(page)
   }
   
   scope :search_for_id_and_name, -> (keyword) {
     where("name LIKE ?", "%#{keyword}%").
     or(where("id LIKE ?", "%#{keyword}%"))
   }
 
   scope :sort_products, -> (sort_order, page) {
     on_category(sort_order[:sort_category]).
     sort_order(sort_order[:sort]).
     display_list(page)
   }
  
  scope :sort_list, -> { 
     {
       "並び替え" => "",
       "価格の安い順" => "price asc",
       "価格の高い順" => "price desc", 
       "出品の古い順" => "updated_at asc", 
       "出品の新しい順" => "updated_at desc"
     }
   }
   
   def reviews_new
    reviews.new
   end
  
   def reviews_with_id
     reviews.reviews_with_id
   end
   
   scope :recommend_products, -> (number) { where(recommended_flag: true).take(number) }
   scope :check_products_carriage_list, -> (product_ids) { where(id: product_ids).pluck(:carriage_flag)}
   
   class << self
    def import_csv(file)
      new_products = []
      update_products = []
      CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
        row_to_hash = row.to_hash
        if row_to_hash['id'].present?
          update_product = find(row_to_hash['id'])
          update_product.attributes = row.to_hash.slice!(csv_attributes)
          update_products << update_product
        else
          new_product = new
          new_product.attributes = row.to_hash.slice!(csv_attributes)
          new_products << new_product
        end
      end
      if update_products.present?
        import update_products, on_duplicate_key_update: csv_attributes
      elsif new_products.present?
        import new_products
      end
    end
 
 
   
   private
     def csv_attributes
       %i[id name description price category_id recommended_flag carriage_flag notdisplay_flag image_url image_url2 image_url3 image_url4 image_url5 image_url6 image_url7 image_url8 image_url9 image_url10 detailed_explanation product_spec review_comments review_quantity rating_score brand price_with_tax product_demension item_weight order_url asin item_model_number stock_out_flag]
     end
   end
end