module Statusable
  extend ActiveSupport::Concern

  included do
    enum status: ancestors.first::STATUSES

    default_scope { where(status: ancestors.first::STATUSES.first) }

    validates :status, presence: true
  end

  def status_text(val = nil)
    val = status if val.nil?
    I18n.t("simple_form.options.defaults.status.#{val.to_s}", default: val.to_s.humanize)
  end

  def statuses
    model::STATUSES
  end

  def model
    self.class
  end
end