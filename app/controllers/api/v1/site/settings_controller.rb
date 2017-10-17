class Api::V1::Site::SettingsController < ApiController
  def index
    @site_settings = Site::Setting.api(@api_key)
  end
end