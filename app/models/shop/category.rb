class Shop::Category < ApplicationRecord
  include Keyable
  include Searchable
  include Sluggable
  include Imageable

  has_many :subcategories, :class_name => 'Shop::Category', :foreign_key => 'parent_id', :dependent => :destroy
  belongs_to :parent, :class_name => 'Shop::Category', optional: true
  has_many :products, :class_name => 'Shop::Product', :foreign_key => 'shop_category_id'

  scope :parental_except_id, ->(id) { where('parent_id IS NULL AND slug != ?', id) }
  scope :parental, -> { where(parent_id: nil) }

  def to_label
    "#{title}"
  end

  resourcify
end
