json.data do
  json.array! @products do |product|
    json.partial! 'api/v1/shop/products/product', product: product

    json.category do
      json.partial! 'api/v1/shop/categories/category', category: product.category
    end
  end
end

json.count @products.total_count

json.page do
  if @products.present?
    json.per_page @products.limit_value
    json.current_page @products.current_page
    json.total_pages @products.total_pages
    json.next_page api_v1_shop_products_url(@products,
                                                 page: @products.next_page,
                                                 per_page: @products.limit_value,
                                                 format: :json,
                                                 api_key: @api_key)

    json.prev_page api_v1_shop_products_url(@products,
                                                 page: @products.prev_page,
                                                 per_page: @products.limit_value,
                                                 format: :json,
                                                 api_key: @api_key)
  else
    json.nil!
  end
end