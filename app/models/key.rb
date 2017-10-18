class Key < ApplicationRecord
  include Keyable
  include Imageable
  include Searchable

  belongs_to :user

  resourcify

  validates :title, :site, presence: true

  def to_label_user
    "#{user.to_label}"
  end

  def to_label
    "#{site} - #{title}"
  end
end
