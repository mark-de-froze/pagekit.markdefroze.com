class Portfolio::Image < ApplicationRecord
  include Keyable
  include Searchable
  include Imageable

  belongs_to :project, :class_name => 'Portfolio::Project', :foreign_key => 'portfolio_project_id', optional: true

  validates :image, presence: true
end
