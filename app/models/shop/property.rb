class Shop::Property < ApplicationRecord
  include Searchable

  has_one :product, :class_name => 'Shop::Product', :foreign_key => 'shop_product_id'

  validates :value, presence: true

  KEYS = [ :composition, :weight, :form, :expiry_date ]
  enum key: KEYS

  def key_text(val = nil)
    val = key if val.nil?
    I18n.t("simple_form.options.defaults.key.#{val.to_s}", default: val.to_s.humanize)
  end

  def keys
    KEYS
  end

  def to_label
    "#{value}"
  end

  resourcify
end