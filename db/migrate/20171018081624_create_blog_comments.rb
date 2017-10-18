class CreateBlogComments < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_comments do |t|
      t.string :api_key
      t.string :from_name
      t.string :from_email
      t.text :comment
      t.integer :status
      t.references :blog_post, foreign_key: true

      t.timestamps
    end
  end
end
