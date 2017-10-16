class CreateUsersKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :keys do |t|
      t.string :api_key
      t.string :site
      t.references :user, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
