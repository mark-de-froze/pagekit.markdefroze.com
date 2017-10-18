class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.string :api_key
      t.string :title
      t.string :slug
      t.text :content
      t.integer :status
      t.references :user, foreign_key: true
      t.string :tags
      t.datetime :published_at
      t.string :image
      t.string :metatitle
      t.text :metakeywords
      t.text :metadescription
      t.timestamps
    end
  end
end
