class CreateSiteWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :site_widgets do |t|
      t.string :api_key
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :section
      t.integer :status
      t.integer :position

      t.timestamps
    end
  end
end
