class CreateSitePages < ActiveRecord::Migration[5.1]
  def change
    create_table :site_pages do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.integer :status
      t.string :metatitle
      t.text :metakeywords
      t.text :metadescription
      t.string :api_key

      t.timestamps
    end
  end
end
