class ApiController < ApplicationController
  include Response
  include ExceptionHandler
  include ActionController::ImplicitRender
  before_action :verify_api_key

  def verify_api_key
    unless params[:api_key].present?
      json_response({ message: 'ApiKeyInvalid' }, :bad_request)
    else
      @api_key = params[:api_key].html_safe
    end
  end
end
