class AddNotdisplayFlagToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :notdisplay_flag, :boolean, default: false, null: false
  end
end
