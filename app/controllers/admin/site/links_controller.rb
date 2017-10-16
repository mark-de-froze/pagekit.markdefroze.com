class Admin::Site::LinksController < AdminController
  authorize_resource param_method: :site_link_params, class: 'Site::Link'

  before_action :set_site_link, only: [:show, :edit, :update, :destroy]

  # GET /admin/site/links
  def index
    @search = params[:search].to_s.html_safe

    @site_links = Site::Link.unscoped
                        .order(:updated_at)
                        .api(@api_keys_array)
                        .search(:title, @search)
                        .page(params[:page])
  end

  # GET /admin/site/links/1
  def show
  end

  # GET /admin/site/links/new
  def new
    @site_link = Site::Link.new
  end

  # GET /admin/site/links/1/edit
  def edit
  end

  # POST /admin/site/links
  def create
    @site_link = Site::Link.new(site_link_params)

    if @site_link.save
      redirect_to @site_link, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/site/links/1
  def update
    if @site_link.update(site_link_params)
      redirect_to @site_link, notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/site/links/1
  def destroy
    @site_link.destroy
    redirect_to site_links_url, notice: 'Link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_link
      @site_link = Site::Link.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def site_link_params
      params.require(:site_link).permit(:api_key, :title, :url, :section, :status, :is_visible_main, :is_visible_offcanvas)
    end
end
