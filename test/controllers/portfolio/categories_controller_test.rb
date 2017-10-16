require 'test_helper'

class Portfolio::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_category = portfolio_categories(:one)
  end

  test "should get index" do
    get portfolio_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_category_url
    assert_response :success
  end

  test "should create portfolio_category" do
    assert_difference('Portfolio::Category.count') do
      post portfolio_categories_url, params: { portfolio_category: { api_key: @portfolio_category.api_key, content: @portfolio_category.content, image: @portfolio_category.image, parent_id: @portfolio_category.parent_id, slug: @portfolio_category.slug, title: @portfolio_category.title } }
    end

    assert_redirected_to portfolio_category_url(Portfolio::Category.last)
  end

  test "should show portfolio_category" do
    get portfolio_category_url(@portfolio_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_category_url(@portfolio_category)
    assert_response :success
  end

  test "should update portfolio_category" do
    patch portfolio_category_url(@portfolio_category), params: { portfolio_category: { api_key: @portfolio_category.api_key, content: @portfolio_category.content, image: @portfolio_category.image, parent_id: @portfolio_category.parent_id, slug: @portfolio_category.slug, title: @portfolio_category.title } }
    assert_redirected_to portfolio_category_url(@portfolio_category)
  end

  test "should destroy portfolio_category" do
    assert_difference('Portfolio::Category.count', -1) do
      delete portfolio_category_url(@portfolio_category)
    end

    assert_redirected_to portfolio_categories_url
  end
end
