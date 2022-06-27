class AddProductDemensionToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_demension, :string
  end
end
