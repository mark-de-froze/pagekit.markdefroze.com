class Admin::Shop::ProductsController < AdminController
  include Uploader

  authorize_resource param_method: :shop_product_params, class: 'Shop::Product'

  before_action :set_shop_product, only: [:show, :edit, :update, :destroy]
  before_action :set_uploader, only: [:new, :create, :edit, :update]
  before_action :set_image, only: [:edit]

  def render(*args)
    set_image if @_action_name == 'new'
    super
  end

  # GET /shop/products
  def index
    @search = params[:search].to_s.html_safe

    @shop_products = Shop::Product.unscoped
                           .api(@api_keys_array)
                           .search(:title, @search)
                           .order(updated_at: :desc)
                           .page(params[:page])
  end

  # GET /shop/products/1
  def show
  end

  # GET /shop/products/new
  def new
    @shop_product = Shop::Product.new
  end

  # GET /shop/products/1/edit
  def edit
  end

  # POST /shop/products
  def create
    @shop_product = Shop::Product.new(shop_product_params)

    if @shop_product.save
      redirect_to @shop_product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shop/products/1
  def update
    if @shop_product.update(shop_product_params)
      redirect_to @shop_product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shop/products/1
  def destroy
    @shop_product.destroy
    redirect_to shop_products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_product
      @shop_product = Shop::Product.unscoped.friendly.api(@api_keys_array).find(params[:id])
    end

    def set_image
      @shop_product.image = image_url if image_url.present?
    end

    # Only allow a trusted parameter "white list" through.
    def shop_product_params
      params.require(:shop_product).permit(:api_key, :title, :slug, :content, :status, :image, :shop_category_id, :product_price, :delivery_price, :sku, :weigth, :location, :delivery, :in_stock, :note, :metatitle, :metakeywords, :metadescription)
    end
end
