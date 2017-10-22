class CreateShopProperty < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_properties do |t|
      t.references :shop_product, foreign_key: true
      t.integer :key
      t.string :value
    end
  end
end
