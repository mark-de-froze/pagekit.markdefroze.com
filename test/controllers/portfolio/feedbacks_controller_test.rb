require 'test_helper'

class Portfolio::FeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_feedback = portfolio_feedbacks(:one)
  end

  test "should get index" do
    get portfolio_feedbacks_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_feedback_url
    assert_response :success
  end

  test "should create portfolio_feedback" do
    assert_difference('Portfolio::Feedback.count') do
      post portfolio_feedbacks_url, params: { portfolio_feedback: { api_key: @portfolio_feedback.api_key, content: @portfolio_feedback.content, portfolio_project_id: @portfolio_feedback.portfolio_project_id, published_at: @portfolio_feedback.published_at, status: @portfolio_feedback.status, title: @portfolio_feedback.title } }
    end

    assert_redirected_to portfolio_feedback_url(Portfolio::Feedback.last)
  end

  test "should show portfolio_feedback" do
    get portfolio_feedback_url(@portfolio_feedback)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_feedback_url(@portfolio_feedback)
    assert_response :success
  end

  test "should update portfolio_feedback" do
    patch portfolio_feedback_url(@portfolio_feedback), params: { portfolio_feedback: { api_key: @portfolio_feedback.api_key, content: @portfolio_feedback.content, portfolio_project_id: @portfolio_feedback.portfolio_project_id, published_at: @portfolio_feedback.published_at, status: @portfolio_feedback.status, title: @portfolio_feedback.title } }
    assert_redirected_to portfolio_feedback_url(@portfolio_feedback)
  end

  test "should destroy portfolio_feedback" do
    assert_difference('Portfolio::Feedback.count', -1) do
      delete portfolio_feedback_url(@portfolio_feedback)
    end

    assert_redirected_to portfolio_feedbacks_url
  end
end
