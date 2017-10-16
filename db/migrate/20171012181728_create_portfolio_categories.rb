class CreatePortfolioCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_categories do |t|
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
