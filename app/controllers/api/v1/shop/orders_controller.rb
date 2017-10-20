class Api::V1::Shop::OrdersController < ApiController
  def show
    @order = Shop::Order.unscoped.api(@api_key).find(params[:id])
  end
end