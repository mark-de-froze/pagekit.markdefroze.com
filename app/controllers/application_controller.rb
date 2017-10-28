class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  before_action :set_api_key

  private
    def set_locale
      if current_user.present?
        I18n.locale = current_user.locale.to_sym if current_user.locale.present?
      end
    end

    def set_api_key
      @pagekit_api_key = ENV.fetch('API_KEY')
    end
end
