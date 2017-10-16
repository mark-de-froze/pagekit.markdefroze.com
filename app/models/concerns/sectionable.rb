module Sectionable
  extend ActiveSupport::Concern

  included do
    enum section: ancestors.first::SECTIONS

    validates :section, presence: true
  end

  def section_text
    I18n.t("simple_form.options.defaults.section.#{status.to_s}", default: status.to_s.humanize)
  end

  def sections
    model::SECTIONS
  end

  def model
    self.class
  end
end