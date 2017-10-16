class Api::V1::Portfolio::CategoriesController < ApiController

  def index
    @categories = Portfolio::Category.api(@api_key).order(:updated_at).parental
  end

  def show
    @category = Portfolio::Category.api(@api_key).friendly.find(params[:id])
    @projects = @category.projects.page(params[:page])

    if params[:per_page].present?
      @projects = @projects.per(params[:per_page])
    end
  end

end