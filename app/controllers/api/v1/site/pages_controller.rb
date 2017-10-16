class Api::V1::Site::PagesController < ApiController

  def index
    @pages = Site::Page.api(@api_key).page(params[:page])

    if params[:per_page].present?
      @pages = @pages.per(params[:per_page])
    end
  end

  def show
    @page = Site::Page.api(@api_key).friendly.find(params[:id])
  end
end