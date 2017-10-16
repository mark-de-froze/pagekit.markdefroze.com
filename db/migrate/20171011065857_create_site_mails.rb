class CreateSiteMails < ActiveRecord::Migration[5.1]
  def change
    create_table :site_mails do |t|
      t.string :from_name
      t.string :from_email
      t.string :subject
      t.text :message
      t.integer :status
      t.string :api_key

      t.timestamps
    end
  end
end
