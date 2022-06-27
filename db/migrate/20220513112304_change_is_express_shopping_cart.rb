class ChangeIsExpressShoppingCart < ActiveRecord::Migration[5.2]
  def change
    change_column_null :shopping_carts, :is_express, false, false
    change_column_default :shopping_carts, :is_express, from: nil, to: false
  end
end
