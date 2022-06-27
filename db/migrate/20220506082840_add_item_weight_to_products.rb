class AddItemWeightToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :item_weight, :string
  end
end
