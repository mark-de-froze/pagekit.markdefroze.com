module Prioritable
  extend ActiveSupport::Concern

  included do
    enum priority: ancestors.first::PRIORITIES

    default_scope { order(priority: :desc)}

    validates :priority, presence: true
  end

  def priority_text
    I18n.t("simple_form.options.defaults.priority.#{priority.to_s}", default: priority.to_s.humanize)
  end

  def priorities
    model::PRIORITIES
  end

  def model
    self.class
  end
end