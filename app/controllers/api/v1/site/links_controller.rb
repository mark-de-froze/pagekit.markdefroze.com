class Api::V1::Site::LinksController < ApiController

  def index
    @links = Site::Link.api(@api_key)
  end
end