class Shop::Order < ApplicationRecord
  include Keyable
  include From

  STATUSES = [ :accepted, :processed, :pending, :shipped, :delivered, :waiting , :completed ]
  include Statusable

  has_many :details, :class_name => 'Shop::Detail', :foreign_key => 'shop_order_id', :dependent => :destroy
  accepts_nested_attributes_for :details, reject_if: :all_blank, :allow_destroy => true

  scope :search, ->(key,value) { where("#{key} = ?", value) unless value.nil? }

  validates :delivery_address, :delivery_zipcode, presence: true
  validates :from_phone, presence: true
  validates :amount, numericality: { :greater_than_or_equal_to => 0, :allow_blank => true }, presence: true
  validates_associated :details

  def create_date
    created_at.strftime("%d %B, %Y %H:%M")
  end

  def to_label
    "#{I18n::t(:order)} ##{id.to_s} #{from} #{create_date}"
  end

  def from_phone_hide
    "#{from_phone.first(3)}***#{from_phone.last(4)}"
  end

  def from_email_hide
    "#{from_email.first(3)}***@#{from_email.split('@').slice(1)}"
  end

  resourcify
end
