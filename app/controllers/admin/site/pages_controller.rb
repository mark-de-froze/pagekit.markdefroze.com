class Admin::Site::PagesController < AdminController
  authorize_resource param_method: :site_page_params, class: 'Site::Page'

  before_action :set_site_page, only: [:show, :edit, :update, :destroy]

  # GET /site/pages
  def index
    @search = params[:search].to_s.html_safe

    @site_pages = Site::Page.unscoped
                      .order(updated_at: :desc)
                      .api(@api_keys_array)
                      .search(:title, @search)
                      .page(params[:page])
  end

  # GET /site/pages/1
  def show
  end

  # GET /site/pages/new
  def new
    @site_page = Site::Page.new
  end

  # GET /site/pages/1/edit
  def edit
  end

  # POST /site/pages
  def create
    @site_page = Site::Page.new(site_page_params)

    if @site_page.save
      redirect_to @site_page, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /site/pages/1
  def update
    if @site_page.update(site_page_params)
      redirect_to @site_page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /site/pages/1
  def destroy
    @site_page.destroy
    redirect_to site_pages_url, notice: 'Page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_page
      @site_page = Site::Page.unscoped.friendly.api(@api_keys_array).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def site_page_params

      params.require(:site_page).permit(:title, :slug, :content, :status, :metatitle, :metakeywords, :metadescription, :api_key)
    end
end
