class Portfolio::Project < ApplicationRecord
  include Keyable
  include Searchable
  include Sluggable
  include Imageable

  STATUSES = [ :published, :unpublished ]
  include Statusable

  PRIORITIES = [ :low, :normal, :high ]
  include Prioritable

  belongs_to :category, :class_name => 'Portfolio::Category', :foreign_key => 'portfolio_category_id'
  has_one :feedback, :class_name => 'Portfolio::Feedback', :foreign_key => 'portfolio_project_id', :dependent => :destroy
  has_many :images, :class_name => 'Portfolio::Image', :foreign_key => 'portfolio_project_id', :dependent => :destroy
  accepts_nested_attributes_for :images

  def to_label
    "#{title}"
  end

  resourcify
end