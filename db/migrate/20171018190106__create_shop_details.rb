class CreateShopDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_details do |t|
      t.string :api_key
      t.references :shop_order, foreign_key: true
      t.references :shop_product, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
