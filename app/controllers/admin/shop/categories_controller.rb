class Admin::Shop::CategoriesController < AdminController
  include Uploader

  authorize_resource param_method: :shop_category_params, class: 'Shop::Category'

  before_action :set_shop_category, only: [:show, :edit, :update, :destroy]
  before_action :set_parental, only: [:new, :create]
  before_action :set_parental_except_id, only: [:edit, :update]
  before_action :set_uploader, only: [:new, :create, :edit, :update]
  before_action :set_image, only: [:edit]

  # GET /shop/categories
  def index
    @search = params[:search].to_s.html_safe

    @shop_categories = Shop::Category.unscoped
                                .api(@api_keys_array)
                                .search(:title, @search)
                                .parental
                                .order(updated_at: :desc)
                                .page(params[:page])
  end

  # GET /shop/categories/1
  def show
  end

  # GET /shop/categories/new
  def new
    @shop_category = Shop::Category.new
    set_image
  end

  # GET /shop/categories/1/edit
  def edit
  end

  # POST /shop/categories
  def create
    @shop_category = Shop::Category.new(shop_category_params)

    if @shop_category.save
      redirect_to @shop_category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shop/categories/1
  def update
    if @shop_category.update(shop_category_params)
      redirect_to @shop_category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shop/categories/1
  def destroy
    @shop_category.destroy
    redirect_to shop_categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_category
      @shop_category = Shop::Category.unscoped.friendly.api(@api_keys_array).find(params[:id])
    end

    def set_image
      @shop_category.image = image_url
    end

    def set_parental
      @shop_categories = Shop::Category.parental
    end

    def set_parental_except_id
      @shop_categories = Shop::Category.parental_except_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shop_category_params
      params.require(:shop_category).permit(:api_key, :title, :slug, :content, :parent_id, :image)
    end
end
