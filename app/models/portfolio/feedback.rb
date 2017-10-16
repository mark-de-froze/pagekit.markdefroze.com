class Portfolio::Feedback < ApplicationRecord
  include Keyable
  include Searchable

  STATUSES = [ :enabled, :disabled ]
  include Statusable

  belongs_to :project, :class_name => 'Portfolio::Project', :foreign_key => 'portfolio_project_id'

  validates :content, presence: true

  resourcify
end
