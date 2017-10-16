class CreatePortfolioArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_articles do |t|
      t.string :api_key
      t.string :title
      t.string :slug
      t.text :content
      t.integer :status
      t.string :tags
      t.datetime :published_at

      t.timestamps
    end
  end
end
