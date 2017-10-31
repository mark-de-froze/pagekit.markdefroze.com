class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_api_key

  private
    def set_api_key
      @pagekit_api_key = ENV.fetch('API_KEY')
    end
end
