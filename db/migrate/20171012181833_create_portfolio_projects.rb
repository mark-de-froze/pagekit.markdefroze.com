class CreatePortfolioProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_projects do |t|
      t.string :api_key
      t.string :title
      t.string :subtitle
      t.string :slug
      t.text :content
      t.integer :status
      t.integer :priority
      t.string :customer
      t.string :image
      t.references :portfolio_category, foreign_key: true
      t.string :metatitle
      t.text :metakeywords
      t.text :metadescription
      t.datetime :published_at

      t.timestamps
    end
  end
end
