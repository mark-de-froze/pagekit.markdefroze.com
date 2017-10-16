class Portfolio::Article < ApplicationRecord
  include Keyable
  include Searchable
  include Sluggable

  STATUSES = [ :published, :draft, :unpublished ]
  include Statusable

  default_scope { order(published_at: :desc) }

  validates :published_at, presence: true

  validates :content, presence: true

  resourcify
end
