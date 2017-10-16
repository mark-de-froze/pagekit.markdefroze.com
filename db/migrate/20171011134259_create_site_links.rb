class CreateSiteLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :site_links do |t|
      t.string :api_key
      t.string :title
      t.string :url
      t.string :section
      t.integer :status
      t.boolean :is_visible_main
      t.boolean :is_visible_offcanvas

      t.timestamps
    end
  end
end
