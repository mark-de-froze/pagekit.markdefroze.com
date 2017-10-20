json.partial! 'api/v1/shop/products/product', product: @product

json.category do
  json.partial! 'api/v1/shop/categories/category', category: @product.category
end