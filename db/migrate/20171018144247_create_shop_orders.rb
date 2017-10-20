class CreateShopOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_orders do |t|
      t.string :api_key
      t.integer :status
      t.decimal :amount
      t.string :coupon
      t.string :tracking_number
      t.datetime :shipped_at
      t.datetime :delivered_at
      t.datetime :paymented_at
      t.string :from_email
      t.string :from_name
      t.string :from_phone
      t.string :delivery_address
      t.string :delivery_zipcode
      t.text :note

      t.timestamps
    end
  end
end
