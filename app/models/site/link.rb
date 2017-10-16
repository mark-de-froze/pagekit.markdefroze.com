class Site::Link < ApplicationRecord
  include Keyable
  include Searchable

  STATUSES = [ :enabled, :disabled ]
  include Statusable

  validates :title, :url, :section, presence: true

  validates_format_of :section, :with => /\A([^\d\W]|[-])*\z/

end
