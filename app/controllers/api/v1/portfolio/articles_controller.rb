class Api::V1::Portfolio::ArticlesController < ApiController

  def index
    @articles = Portfolio::Article.api(@api_key).friendly.page params[:page]

    if params[:per_page].present?
      @articles = @articles.per(params[:per_page])
    end
  end

  def show
    @article = Portfolio::Article.api(@api_key).friendly.find(params[:id])
  end
end