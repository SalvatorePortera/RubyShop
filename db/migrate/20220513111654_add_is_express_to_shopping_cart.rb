class AddIsExpressToShoppingCart < ActiveRecord::Migration[5.2]
  def change
    add_column :shopping_carts, :is_express, :boolean
  end
end
