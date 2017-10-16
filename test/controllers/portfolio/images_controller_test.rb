require 'test_helper'

class Portfolio::ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_image = portfolio_images(:one)
  end

  test "should get index" do
    get portfolio_images_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_image_url
    assert_response :success
  end

  test "should create portfolio_image" do
    assert_difference('Portfolio::Image.count') do
      post portfolio_images_url, params: { portfolio_image: { image: @portfolio_image.image, portfolio_project_id: @portfolio_image.portfolio_project_id } }
    end

    assert_redirected_to portfolio_image_url(Portfolio::Image.last)
  end

  test "should show portfolio_image" do
    get portfolio_image_url(@portfolio_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_image_url(@portfolio_image)
    assert_response :success
  end

  test "should update portfolio_image" do
    patch portfolio_image_url(@portfolio_image), params: { portfolio_image: { image: @portfolio_image.image, portfolio_project_id: @portfolio_image.portfolio_project_id } }
    assert_redirected_to portfolio_image_url(@portfolio_image)
  end

  test "should destroy portfolio_image" do
    assert_difference('Portfolio::Image.count', -1) do
      delete portfolio_image_url(@portfolio_image)
    end

    assert_redirected_to portfolio_images_url
  end
end
