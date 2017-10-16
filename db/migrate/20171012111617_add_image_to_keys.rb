class AddImageToKeys < ActiveRecord::Migration[5.1]
  def change
    add_column :keys, :image, :string
  end
end
