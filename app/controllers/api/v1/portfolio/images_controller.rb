class Api::V1::Portfolio::ImagesController < ApiController

  def index
    @images = Portfolio::Image.api(@api_key).where(portfolio_project_id: nil)
  end
end