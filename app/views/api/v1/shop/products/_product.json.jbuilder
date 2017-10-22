json.extract! product, :id, :title, :slug, :content, :image, :product_price, :delivery_price, :sku, :weigth, :location, :delivery, :in_stock, :note, :metadescription, :metakeywords, :metatitle, :created_at, :updated_at
json.properties do
  product.properties.each do |property|
    json.set! property.key, property.value
  end
end
json.api api_v1_shop_product_url(product, format: :json, id: product.id, api_key: @api_key)