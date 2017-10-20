json.partial! 'api/v1/shop/categories/category', category: @category

json.parent do
  if @category.parent
    json.partial! 'api/v1/shop/categories/category', category: @category.parent
  else
    json.nil!
  end
end

json.subcategories do
  if @category.subcategories.present?
    json.partial! 'api/v1/shop/categories/category', collection: @category.subcategories, as: :category
  else
    json.nil!
  end
end

json.products do
  json.data do
    if @products.present?
      json.partial! 'api/v1/shop/products/product', collection: @products, as: :product
    else
      json.nil!
    end
  end

  json.count @products.total_count

  json.page do
    if @products.present?
      json.per_page @products.limit_value
      json.current_page @products.current_page
      json.total_pages @products.total_pages
      json.next_page api_v1_shop_category_url(@category,
                                                   id: @category.id,
                                                   page: @products.next_page,
                                                   per_page: @products.limit_value,
                                                   format: :json, api_key: @api_key)

      json.prev_page api_v1_shop_category_url(@category,
                                                   id: @category.id,
                                                   page: @products.prev_page,
                                                   per_page: @products.limit_value,
                                                   format: :json, api_key: @api_key)
    else
      json.nil!
    end
  end
end