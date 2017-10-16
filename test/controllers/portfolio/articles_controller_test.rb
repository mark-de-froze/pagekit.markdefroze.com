require 'test_helper'

class Portfolio::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_article = portfolio_articles(:one)
  end

  test "should get index" do
    get portfolio_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_article_url
    assert_response :success
  end

  test "should create portfolio_article" do
    assert_difference('Portfolio::Article.count') do
      post portfolio_articles_url, params: { portfolio_article: { api_key: @portfolio_article.api_key, content: @portfolio_article.content, published_at: @portfolio_article.published_at, slug: @portfolio_article.slug, status: @portfolio_article.status, tags: @portfolio_article.tags, title: @portfolio_article.title } }
    end

    assert_redirected_to portfolio_article_url(Portfolio::Article.last)
  end

  test "should show portfolio_article" do
    get portfolio_article_url(@portfolio_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_article_url(@portfolio_article)
    assert_response :success
  end

  test "should update portfolio_article" do
    patch portfolio_article_url(@portfolio_article), params: { portfolio_article: { api_key: @portfolio_article.api_key, content: @portfolio_article.content, published_at: @portfolio_article.published_at, slug: @portfolio_article.slug, status: @portfolio_article.status, tags: @portfolio_article.tags, title: @portfolio_article.title } }
    assert_redirected_to portfolio_article_url(@portfolio_article)
  end

  test "should destroy portfolio_article" do
    assert_difference('Portfolio::Article.count', -1) do
      delete portfolio_article_url(@portfolio_article)
    end

    assert_redirected_to portfolio_articles_url
  end
end
