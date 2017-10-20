class ChangeTypeToShopProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :shop_products, :delivery_price, :decimal, :precision => 10, :scale => 2
    change_column :shop_products, :product_price, :decimal, :precision => 10, :scale => 2
    change_column :shop_products, :weigth, :decimal, :precision => 10, :scale => 2
  end
end
