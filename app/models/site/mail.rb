class Site::Mail < ApplicationRecord
  include Keyable
  include Searchable

  STATUSES = [ :read, :unread ]
  include Statusable

  validates :from_name, :from_email, :subject, :message, presence: true
  validates :from_email, email: true

  resourcify

  def from
    "#{from_name} <#{from_email}>"
  end
end
