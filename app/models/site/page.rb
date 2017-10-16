class Site::Page < ApplicationRecord
  include Keyable
  include Searchable
  include Sluggable

  STATUSES = [ :enabled, :disabled ]
  include Statusable

  resourcify
end
