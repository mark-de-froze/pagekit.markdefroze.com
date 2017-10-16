class CreatePortfolioImages < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_images do |t|
      t.references :portfolio_project, foreign_key: true
      t.string :api_key
      t.string :image
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
