class Api::V1::Shop::ProductsController < ApiController

  def index
    @products = Shop::Product.api(@api_key).page(params[:page])

    if params[:per_page].present?
      @products = @products.per(params[:per_page])
    end
  end

  def show
    @product = Shop::Product.api(@api_key).friendly.find(params[:id])
  end

end