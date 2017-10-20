class Admin::Shop::DetailsController < AdminController
  authorize_resource param_method: :shop_detail_params, class: 'Shop::Detail'

  before_action :set_shop_detail, only: [:show, :edit, :update, :destroy]
  before_action :set_orders_and_products, only: [:new, :create, :edit, :update]

  # GET /shop/details
  def index
    @shop_details = Shop::Detail.all
  end

  # GET /shop/details/1
  def show
    redirect_to @shop_detail.order
  end

  # GET /shop/details/new
  def new
    @shop_detail = Shop::Detail.new(shop_detail_params)
  end

  # GET /shop/details/1/edit
  def edit
  end

  # POST /shop/details
  def create
    @shop_detail = Shop::Detail.new(shop_detail_params)

    if @shop_detail.save
      redirect_to @shop_detail.order, notice: 'Detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shop/details/1
  def update
    if @shop_detail.update(shop_detail_params)
      redirect_to @shop_detail.order, notice: 'Detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shop/details/1
  def destroy
    @order = @shop_detail.order
    @shop_detail.destroy
    redirect_to @order, notice: 'Detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_detail
      @shop_detail = Shop::Detail.find(params[:id])
    end

    def set_orders_and_products
      @orders = Shop::Order.unscoped.api(@api_keys_array)
      @products = Shop::Product.unscoped.api(@api_keys_array)
    end

    # Only allow a trusted parameter "white list" through.
    def shop_detail_params
      params.require(:shop_detail).permit(:api_key, :shop_order_id, :shop_product_id, :quantity) if params[:shop_detail].present?
    end
end
