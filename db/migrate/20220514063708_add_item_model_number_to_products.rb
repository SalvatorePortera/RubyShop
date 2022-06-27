class AddItemModelNumberToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :item_model_number, :string
  end
end
