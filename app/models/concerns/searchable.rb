module Searchable
  extend ActiveSupport::Concern

  included do
    scope :search, ->(key,value) { where("lower(#{key}) LIKE ?", "%#{value.downcase}%") unless value.empty? }
  end

end