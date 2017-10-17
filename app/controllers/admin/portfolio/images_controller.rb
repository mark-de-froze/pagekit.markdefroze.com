class Admin::Portfolio::ImagesController < AdminController
  authorize_resource param_method: :portfolio_image_params, class: 'Portfolio::Image'

  before_action :set_portfolio_image, only: [:show, :edit, :update, :destroy]
  before_action :set_uploader, only: [:index, :new, :create, :edit, :update]
  before_action :set_image, only: [:edit]

  # GET /admin/portfolio/images
  def index
    @search = params[:search].to_s.html_safe

    @portfolio_images = Portfolio::Image.unscoped
                            .search(:title, @search)
                            .order(updated_at: :desc)
                            .page(params[:page])
  end

  # GET /admin/portfolio/images/1
  def show
  end

  # GET /admin/portfolio/images/new
  def new
    @portfolio_image = Portfolio::Image.new(portfolio_image_params)
    set_image
  end

  # GET /admin/portfolio/images/1/edit
  def edit
  end

  # POST /admin/portfolio/images
  def create
    @portfolio_image = Portfolio::Image.new(portfolio_image_params)

    if @portfolio_image.save
      redirect_to @portfolio_image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/portfolio/images/1
  def update
    if @portfolio_image.update(portfolio_image_params)
      redirect_to @portfolio_image, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/portfolio/images/1
  def destroy
    @portfolio_image.destroy
    redirect_to portfolio_images_url, notice: 'Image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_image
      @portfolio_image = Portfolio::Image.find(params[:id])
    end

    def set_uploader
      @uploader = Site::File.new.name
      @uploader.success_action_redirect = new_site_file_url(redirect: request.path)
    end

    def set_image
      @portfolio_image.image = @uploader.direct_fog_url+params[:key] if params[:key].present?
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_image_params
      params.require(:portfolio_image).permit(:portfolio_project_id, :api_key, :image, :title, :content, :redirect) if params[:portfolio_image]
    end
end
