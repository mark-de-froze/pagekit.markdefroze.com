module ApplicationHelper
  def date date, format = :long
    I18n.localize date, format: format
  end
end
