require 'test_helper'

class Shop::DetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_detail = shop_details(:one)
  end

  test "should get index" do
    get shop_details_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_detail_url
    assert_response :success
  end

  test "should create shop_detail" do
    assert_difference('Shop::Detail.count') do
      post shop_details_url, params: { shop_detail: { api_key: @shop_detail.api_key, quantity: @shop_detail.quantity, shop_order_id: @shop_detail.shop_order_id, shop_product_id: @shop_detail.shop_product_id } }
    end

    assert_redirected_to shop_detail_url(Shop::Detail.last)
  end

  test "should show shop_detail" do
    get shop_detail_url(@shop_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_detail_url(@shop_detail)
    assert_response :success
  end

  test "should update shop_detail" do
    patch shop_detail_url(@shop_detail), params: { shop_detail: { api_key: @shop_detail.api_key, quantity: @shop_detail.quantity, shop_order_id: @shop_detail.shop_order_id, shop_product_id: @shop_detail.shop_product_id } }
    assert_redirected_to shop_detail_url(@shop_detail)
  end

  test "should destroy shop_detail" do
    assert_difference('Shop::Detail.count', -1) do
      delete shop_detail_url(@shop_detail)
    end

    assert_redirected_to shop_details_url
  end
end
