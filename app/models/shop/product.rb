class Shop::Product < ApplicationRecord
  include Keyable
  include Searchable
  include Sluggable
  include Imageable

  STATUSES = [ :published, :unpublished ]
  include Statusable

  belongs_to :category, :class_name => 'Shop::Category', :foreign_key => 'shop_category_id'

  has_many :properties, :class_name => 'Shop::Property', :foreign_key => 'shop_product_id'
  accepts_nested_attributes_for :properties, reject_if: :all_blank, :allow_destroy => true
  validates_associated :properties

  validates :product_price, presence: true
  validates :in_stock, numericality: { only_integer: true, :allow_blank => true }
  validates :delivery_price, :product_price, :weigth, numericality: { :greater_than_or_equal_to => 0, :allow_blank => true }

  DELIVERIES = [ :no_delivery, :pickup, :post, :on_world, :only_on_country, :only_on_city, :only_on_city_courier]
  enum delivery: DELIVERIES

  def delivery_text
    I18n.t("simple_form.options.defaults.delivery.#{delivery.to_s}", default: delivery.to_s.humanize)
  end

  def deliveries
    DELIVERIES
  end

  def to_label
    "#{title}"
  end

  resourcify
end
