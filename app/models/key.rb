class Key < ApplicationRecord
  include Imageable
  include Searchable

  belongs_to :user

  resourcify

  validates :title, :site, presence: true
  validates :api_key, length: { is: 32 }

  def to_label
    "#{site} - #{title}"
  end
end
