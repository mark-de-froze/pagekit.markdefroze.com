class CreatePortfolioFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_feedbacks do |t|
      t.string :api_key
      t.references :portfolio_project, foreign_key: true
      t.string :title
      t.text :content
      t.integer :status
      t.datetime :published_at

      t.timestamps
    end
  end
end
