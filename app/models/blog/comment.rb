class Blog::Comment < ApplicationRecord
  include Keyable
  include Searchable
  include From
  include Gravtastic

  STATUSES = [ :published, :unpublished ]
  include Statusable

  default_scope { order(created_at: :desc) }

  validates :comment, presence: true

  belongs_to :post, :class_name => 'Blog::Post', :foreign_key => 'blog_post_id'

  gravtastic :from_email, default: 'mm'

  resourcify
end
