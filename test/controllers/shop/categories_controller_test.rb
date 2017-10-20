require 'test_helper'

class Shop::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_category = shop_categories(:one)
  end

  test "should get index" do
    get shop_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_category_url
    assert_response :success
  end

  test "should create shop_category" do
    assert_difference('Shop::Category.count') do
      post shop_categories_url, params: { shop_category: { api_key: @shop_category.api_key, content: @shop_category.content, image: @shop_category.image, parent_id: @shop_category.parent_id, slug: @shop_category.slug, title: @shop_category.title } }
    end

    assert_redirected_to shop_category_url(Shop::Category.last)
  end

  test "should show shop_category" do
    get shop_category_url(@shop_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_category_url(@shop_category)
    assert_response :success
  end

  test "should update shop_category" do
    patch shop_category_url(@shop_category), params: { shop_category: { api_key: @shop_category.api_key, content: @shop_category.content, image: @shop_category.image, parent_id: @shop_category.parent_id, slug: @shop_category.slug, title: @shop_category.title } }
    assert_redirected_to shop_category_url(@shop_category)
  end

  test "should destroy shop_category" do
    assert_difference('Shop::Category.count', -1) do
      delete shop_category_url(@shop_category)
    end

    assert_redirected_to shop_categories_url
  end
end
