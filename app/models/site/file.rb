class Site::File < ApplicationRecord
  include Keyable
  include Searchable

  mount_uploader :name, FileUploader
end
