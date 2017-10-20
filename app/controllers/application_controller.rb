class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  private
    def set_locale
      I18n.locale = current_user.locale.to_sym if current_user.locale.present?
    end
end
