class Api::V1::Site::SettingsController < ApiController
  def index
    @settings = Hash.new
    @site_settings = Site::Setting.api(@api_key)

    @site_settings.each do |setting|
      @settings[setting.section] = Hash.new unless @settings[setting.section].is_a?(Hash)
      @settings[setting.section][setting.key] = setting.value
    end
  end
end