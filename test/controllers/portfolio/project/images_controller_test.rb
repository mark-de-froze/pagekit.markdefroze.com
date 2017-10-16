require 'test_helper'

class Portfolio::Project::ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_project_image = portfolio_project_images(:one)
  end

  test "should get index" do
    get portfolio_project_images_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_project_image_url
    assert_response :success
  end

  test "should create portfolio_project_image" do
    assert_difference('Portfolio::Project::Image.count') do
      post portfolio_project_images_url, params: { portfolio_project_image: { image: @portfolio_project_image.image, portfolio_project_id: @portfolio_project_image.portfolio_project_id } }
    end

    assert_redirected_to portfolio_project_image_url(Portfolio::Project::Image.last)
  end

  test "should show portfolio_project_image" do
    get portfolio_project_image_url(@portfolio_project_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_project_image_url(@portfolio_project_image)
    assert_response :success
  end

  test "should update portfolio_project_image" do
    patch portfolio_project_image_url(@portfolio_project_image), params: { portfolio_project_image: { image: @portfolio_project_image.image, portfolio_project_id: @portfolio_project_image.portfolio_project_id } }
    assert_redirected_to portfolio_project_image_url(@portfolio_project_image)
  end

  test "should destroy portfolio_project_image" do
    assert_difference('Portfolio::Project::Image.count', -1) do
      delete portfolio_project_image_url(@portfolio_project_image)
    end

    assert_redirected_to portfolio_project_images_url
  end
end
