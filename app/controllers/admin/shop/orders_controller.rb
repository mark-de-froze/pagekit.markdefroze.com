class Admin::Shop::OrdersController < AdminController
  authorize_resource param_method: :shop_order_params, class: 'Shop::Order'

  before_action :set_shop_order, only: [:show, :edit, :update, :destroy]

  # GET /shop/orders
  def index
    @search = params[:search].to_s.html_safe

    @shop_orders = Shop::Order.unscoped
                       .api(@api_keys_array)
                       .search('status', Shop::Order.statuses[@search.to_sym])
                       .order(updated_at: :desc)
                       .order(status: :desc)
                       .page(params[:page])
  end

  # GET /shop/orders/1
  def show
  end

  # GET /shop/orders/new
  def new
    @shop_order = Shop::Order.new
  end

  # GET /shop/orders/1/edit
  def edit
  end

  # POST /shop/orders
  def create
    @shop_order = Shop::Order.new(shop_order_params)

    if @shop_order.save
      redirect_to @shop_order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shop/orders/1
  def update
    if @shop_order.update(shop_order_params)
      redirect_to @shop_order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shop/orders/1
  def destroy
    @shop_order.destroy
    redirect_to shop_orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_order
      @shop_order = Shop::Order.unscoped.api(@api_keys_array).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shop_order_params
      params.require(:shop_order).permit(:api_key, :status, :amount, :coupon, :tracking_number, :shipped_at, :delivered_at, :paymented_at, :from_email, :from_name, :from_phone, :delivery_address, :delivery_zipcode, :note, details_attributes: [ :id, :shop_product_id, :quantity, :_destroy] )
    end
end
