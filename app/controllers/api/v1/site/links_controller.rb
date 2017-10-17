class Api::V1::Site::LinksController < ApiController
  before_action :set_links_sections

  def index
    @links = Hash.new
    @site_links = Site::Link.api(@api_key)

    @site_links.each do |link|
      @links[link.section] = Array.new unless @links[link.section].is_a?(Array)
      @links[link.section] << link
    end
  end

  private

    def set_links_sections
      @site_links_sections = Site::Link.api(@api_key).group(:section).pluck(:section)
    end
end