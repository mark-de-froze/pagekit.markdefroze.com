class CreateShopProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_products do |t|
      t.string :api_key
      t.string :title
      t.string :slug
      t.text :content
      t.integer :status
      t.string :image
      t.references :shop_category, foreign_key: true
      t.decimal :product_price
      t.integer :delivery_price
      t.string :sku
      t.decimal :weigth
      t.string :location
      t.integer :delivery
      t.integer :in_stock
      t.text :note
      t.string :metatitle
      t.text :metakeywords
      t.text :metadescription

      t.timestamps
    end
  end
end
