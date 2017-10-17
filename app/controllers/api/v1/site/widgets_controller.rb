class Api::V1::Site::WidgetsController < ApiController

  def index
    @site_widgets = Site::Widget.api(@api_key)
  end
end