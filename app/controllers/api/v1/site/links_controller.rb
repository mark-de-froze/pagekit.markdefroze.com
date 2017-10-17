class Api::V1::Site::LinksController < ApiController
  before_action :set_links_sections

  def index
    @site_links = Site::Link.api(@api_key)
  end

  private

    def set_links_sections
      @site_links_sections = Site::Link.api(@api_key).group(:section).pluck(:section)
    end
end