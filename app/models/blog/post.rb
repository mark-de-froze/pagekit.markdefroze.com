class Blog::Post < ApplicationRecord
  include Keyable
  include Searchable
  include Sluggable
  include Imageable

  STATUSES = [ :published, :draft, :unpublished ]
  include Statusable

  default_scope { order(published_at: :desc) }

  validates :published_at, presence: true

  validates :content, presence: true

  belongs_to :user
  has_many :comments, :class_name => 'Blog::Comment', :foreign_key => 'blog_post_id', :dependent => :destroy

  resourcify

  def publish_date
    published_at.strftime("%B %d, %Y")
  end

  def to_label
    "#{title} - #{publish_date}"
  end
end
