class Api::V1::Portfolio::FeedbacksController < ApiController

  def index
    @feedbacks = Portfolio::Feedback.api(@api_key).page(params[:page])

    if params[:per_page].present?
      @feedbacks = @feedbacks.per(params[:per_page])
    end
  end

  def show
    @feedback = Portfolio::Feedback.api(@api_key).find(params[:id])
  end
end