module Keyable
  extend ActiveSupport::Concern

  included do
    has_one :client, :class_name => 'Users::Key', :foreign_key => 'api_key', :primary_key => 'api_key'
    scope :api, ->(api_keys) { where(api_key: api_keys) if api_keys.present? }

    validates :api_key, presence: true, length: { is: 32 }
  end

end