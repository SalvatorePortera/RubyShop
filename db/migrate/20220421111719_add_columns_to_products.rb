class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :detailed_explanation, :text
    add_column :products, :product_spec, :text
    add_column :products, :review_comments, :text
    add_column :products, :review_quantity, :integer
    add_column :products, :rating_score, :float
  end
end
