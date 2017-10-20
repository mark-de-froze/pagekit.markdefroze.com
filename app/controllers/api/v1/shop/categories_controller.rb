class Api::V1::Shop::CategoriesController < ApiController

  def index
    @categories = Shop::Category.api(@api_key).order(updated_at: :desc).parental
  end

  def show
    @category = Shop::Category.api(@api_key).friendly.find(params[:id])
    @products = @category.products.page(params[:page])

    if params[:per_page].present?
      @products = @products.per(params[:per_page])
    end
  end

end