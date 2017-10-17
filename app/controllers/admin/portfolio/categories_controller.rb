class Admin::Portfolio::CategoriesController < AdminController
  authorize_resource param_method: :portfolio_category_params, class: 'Portfolio::Category'

  before_action :set_portfolio_category, only: [:show, :edit, :update, :destroy]
  before_action :set_parental, only: [:new, :create]
  before_action :set_parental_except_id, only: [:edit, :update]
  before_action :set_uploader, only: [:new, :create, :edit, :update]
  before_action :set_image, only: [:edit]

  # GET /admin/portfolio/categories
  def index
    @search = params[:search].to_s.html_safe

    @portfolio_categories = Portfolio::Category.unscoped
                                .api(@api_keys_array)
                                .search(:title, @search)
                                .parental
                                .order(updated_at: :desc)
                                .page(params[:page])
  end

  # GET /admin/portfolio/categories/1
  def show
  end

  # GET /admin/portfolio/categories/new
  def new
    @portfolio_category = Portfolio::Category.new
    set_image
  end

  # GET /admin/portfolio/categories/1/edit
  def edit
  end

  # POST /admin/portfolio/categories
  def create
    @portfolio_category = Portfolio::Category.new(portfolio_category_params)

    if @portfolio_category.save
      redirect_to @portfolio_category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/portfolio/categories/1
  def update
    if @portfolio_category.update(portfolio_category_params)
      redirect_to @portfolio_category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/portfolio/categories/1
  def destroy
    @portfolio_category.destroy
    redirect_to portfolio_categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_category
      @portfolio_category = Portfolio::Category.unscoped.friendly.api(@api_keys_array).find(params[:id])
    end

    def set_uploader
      @uploader = Site::File.new.name
      @uploader.success_action_redirect = new_site_file_url(redirect: request.path)
    end

    def set_image
      @portfolio_category.image = @uploader.direct_fog_url+params[:key] if params[:key].present?
    end

    def set_parental
      @portfolio_categories = Portfolio::Category.parental
    end

    def set_parental_except_id
      @portfolio_categories = Portfolio::Category.parental_except_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_category_params
      params.require(:portfolio_category).permit(:api_key, :title, :slug, :content, :parent_id, :image)
    end
end
