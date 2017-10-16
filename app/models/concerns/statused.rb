module Statused
  extend ActiveSupport::Concern

  included do
    enum status: ancestors.first::STATUSES

    default_scope { where(status: ancestors.first::STATUSES.first) }

    validates :status, presence: true
  end

  def status_text
    I18n.t("simple_form.options.#{model.to_s.gsub('::','_').downcase}.status.#{status.to_s}", default: status.to_s.humanize)
  end

  def statuses
    model::STATUSES
  end

  def model
    self.class
  end
end