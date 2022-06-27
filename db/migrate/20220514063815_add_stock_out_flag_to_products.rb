class AddStockOutFlagToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :stock_out_flag, :boolean, default: false, null: false
  end
end
