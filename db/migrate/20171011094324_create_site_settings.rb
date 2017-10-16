class CreateSiteSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :site_settings do |t|
      t.string :api_key
      t.string :key
      t.text :value
      t.integer :section

      t.timestamps
    end
  end
end
