class AddImageurlToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image_url, :string
    add_column :products, :image_url2, :string
    add_column :products, :image_url3, :string
    add_column :products, :image_url4, :string
    add_column :products, :image_url5, :string
    add_column :products, :image_url6, :string
    add_column :products, :image_url7, :string
    add_column :products, :image_url8, :string
    add_column :products, :image_url9, :string
    add_column :products, :image_url10, :string
  end
end
