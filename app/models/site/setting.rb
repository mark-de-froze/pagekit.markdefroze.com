class Site::Setting < ApplicationRecord
  include Keyable
  include Searchable

  SECTIONS = [ :contact, :app ]
  include Sectionable

  validates :key, :value, presence: true
  validates :key, uniqueness: { scope: :api_key }

  def key_text
    I18n.t("simple_form.options.#{self.class.to_s.gsub('::','_').downcase}.key.#{self.key}", default: self.key.humanize)
  end

  resourcify
end
