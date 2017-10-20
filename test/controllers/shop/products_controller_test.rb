require 'test_helper'

class Shop::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_product = shop_products(:one)
  end

  test "should get index" do
    get shop_products_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_product_url
    assert_response :success
  end

  test "should create shop_product" do
    assert_difference('Shop::Product.count') do
      post shop_products_url, params: { shop_product: { api_key: @shop_product.api_key, content: @shop_product.content, delivery: @shop_product.delivery, delivery_price: @shop_product.delivery_price, image: @shop_product.image, in_stock: @shop_product.in_stock, location: @shop_product.location, metadescription: @shop_product.metadescription, metakeywords: @shop_product.metakeywords, metatitle: @shop_product.metatitle, note: @shop_product.note, product_price: @shop_product.product_price, shop_category_id: @shop_product.shop_category_id, sku: @shop_product.sku, slug: @shop_product.slug, status: @shop_product.status, title: @shop_product.title, weigth: @shop_product.weigth } }
    end

    assert_redirected_to shop_product_url(Shop::Product.last)
  end

  test "should show shop_product" do
    get shop_product_url(@shop_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_product_url(@shop_product)
    assert_response :success
  end

  test "should update shop_product" do
    patch shop_product_url(@shop_product), params: { shop_product: { api_key: @shop_product.api_key, content: @shop_product.content, delivery: @shop_product.delivery, delivery_price: @shop_product.delivery_price, image: @shop_product.image, in_stock: @shop_product.in_stock, location: @shop_product.location, metadescription: @shop_product.metadescription, metakeywords: @shop_product.metakeywords, metatitle: @shop_product.metatitle, note: @shop_product.note, product_price: @shop_product.product_price, shop_category_id: @shop_product.shop_category_id, sku: @shop_product.sku, slug: @shop_product.slug, status: @shop_product.status, title: @shop_product.title, weigth: @shop_product.weigth } }
    assert_redirected_to shop_product_url(@shop_product)
  end

  test "should destroy shop_product" do
    assert_difference('Shop::Product.count', -1) do
      delete shop_product_url(@shop_product)
    end

    assert_redirected_to shop_products_url
  end
end
