class CreateShopCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_categories do |t|
      t.string :api_key
      t.string :title
      t.string :slug
      t.text :content
      t.references :parent
      t.string :image

      t.timestamps
    end
  end
end
