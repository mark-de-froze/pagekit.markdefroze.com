class Admin::Portfolio::ArticlesController < AdminController
  authorize_resource param_method: :portfolio_article_params, class: 'Portfolio::Article'

  before_action :set_portfolio_article, only: [:show, :edit, :update, :destroy]

  # GET /admin/portfolio/articles
  def index
    @search = params[:search].to_s.html_safe

    @portfolio_articles = Portfolio::Article.unscoped
                              .api(@api_keys_array)
                              .search(:title, @search)
                              .order(:updated_at)
                              .page(params[:page])
  end

  # GET /admin/portfolio/articles/1
  def show
  end

  # GET /admin/portfolio/articles/new
  def new
    @portfolio_article = Portfolio::Article.new
  end

  # GET /admin/portfolio/articles/1/edit
  def edit
  end

  # POST /admin/portfolio/articles
  def create
    @portfolio_article = Portfolio::Article.new(portfolio_article_params)

    if @portfolio_article.save
      redirect_to @portfolio_article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/portfolio/articles/1
  def update
    if @portfolio_article.update(portfolio_article_params)
      redirect_to @portfolio_article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/portfolio/articles/1
  def destroy
    @portfolio_article.destroy
    redirect_to portfolio_articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_article
      @portfolio_article = Portfolio::Article.unscoped.friendly.api(@api_keys_array).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_article_params
      params.require(:portfolio_article).permit(:api_key, :title, :slug, :content, :status, :tags, :published_at)
    end
end
