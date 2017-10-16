class Admin::Portfolio::FeedbacksController < AdminController
  authorize_resource param_method: :portfolio_feedback_params, class: 'Portfolio::Feedback'

  before_action :set_portfolio_feedback, only: [:show, :edit, :update, :destroy]

  # GET /admin/portfolio/feedbacks
  def index
    @search = params[:search].to_s.html_safe

    @portfolio_feedbacks = Portfolio::Feedback.unscoped
                      .order(:updated_at)
                      .api(@api_keys_array)
                      .search(:title, @search)
                      .search(:content, @search)
                      .page(params[:page])
  end

  # GET /admin/portfolio/feedbacks/1
  def show
  end

  # GET /admin/portfolio/feedbacks/new
  def new
    @portfolio_feedback = Portfolio::Feedback.new
  end

  # GET /admin/portfolio/feedbacks/1/edit
  def edit
  end

  # POST /admin/portfolio/feedbacks
  def create
    @portfolio_feedback = Portfolio::Feedback.new(portfolio_feedback_params)

    if @portfolio_feedback.save
      redirect_to @portfolio_feedback, notice: 'Feedback was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/portfolio/feedbacks/1
  def update
    if @portfolio_feedback.update(portfolio_feedback_params)
      redirect_to @portfolio_feedback, notice: 'Feedback was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/portfolio/feedbacks/1
  def destroy
    @portfolio_feedback.destroy
    redirect_to portfolio_feedbacks_url, notice: 'Feedback was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_feedback
      @portfolio_feedback = Portfolio::Feedback.unscoped.api(@api_keys_array).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_feedback_params
      params.require(:portfolio_feedback).permit(:api_key, :portfolio_project_id, :title, :content, :status, :published_at)
    end
end
