class Site::Mail < ApplicationRecord
  include Keyable
  include Searchable
  include From

  STATUSES = [ :read, :unread ]
  include Statusable

  validates :subject, :message, presence: true

  resourcify
end
