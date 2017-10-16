class CreateSiteFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :site_files do |t|
      t.string :api_key
      t.string :name
      t.integer :size
      t.datetime :modified

      t.timestamps
    end
  end
end
