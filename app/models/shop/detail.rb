class Shop::Detail < ApplicationRecord
  include Keyable

  belongs_to :order, -> { unscope(where: :status) }, :class_name => 'Shop::Order', :foreign_key => 'shop_order_id'

  belongs_to :product, -> { unscope(where: :status) }, :class_name => 'Shop::Product', :foreign_key => 'shop_product_id'

  validates :quantity, numericality: { :greater_than_or_equal_to => 1, :allow_blank => false }, presence: true
end
