require 'test_helper'

class Shop::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_order = shop_orders(:one)
  end

  test "should get index" do
    get shop_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_order_url
    assert_response :success
  end

  test "should create shop_order" do
    assert_difference('Shop::Order.count') do
      post shop_orders_url, params: { shop_order: { amount: @shop_order.amount, api_key: @shop_order.api_key, coupon: @shop_order.coupon, delivered_at: @shop_order.delivered_at, delivery_address: @shop_order.delivery_address, delivery_zipcode: @shop_order.delivery_zipcode, from_email: @shop_order.from_email, from_name: @shop_order.from_name, from_phone: @shop_order.from_phone, note: @shop_order.note, paymented_at: @shop_order.paymented_at, shipped_at: @shop_order.shipped_at, status: @shop_order.status, tracking_number: @shop_order.tracking_number } }
    end

    assert_redirected_to shop_order_url(Shop::Order.last)
  end

  test "should show shop_order" do
    get shop_order_url(@shop_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_order_url(@shop_order)
    assert_response :success
  end

  test "should update shop_order" do
    patch shop_order_url(@shop_order), params: { shop_order: { amount: @shop_order.amount, api_key: @shop_order.api_key, coupon: @shop_order.coupon, delivered_at: @shop_order.delivered_at, delivery_address: @shop_order.delivery_address, delivery_zipcode: @shop_order.delivery_zipcode, from_email: @shop_order.from_email, from_name: @shop_order.from_name, from_phone: @shop_order.from_phone, note: @shop_order.note, paymented_at: @shop_order.paymented_at, shipped_at: @shop_order.shipped_at, status: @shop_order.status, tracking_number: @shop_order.tracking_number } }
    assert_redirected_to shop_order_url(@shop_order)
  end

  test "should destroy shop_order" do
    assert_difference('Shop::Order.count', -1) do
      delete shop_order_url(@shop_order)
    end

    assert_redirected_to shop_orders_url
  end
end
