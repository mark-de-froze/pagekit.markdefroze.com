json.extract! product, :id, :title, :slug, :content, :image, :product_price, :delivery_price, :sku, :weigth, :location, :delivery, :in_stock, :note, :metadescription, :metakeywords, :metatitle
json.api api_v1_shop_product_url(product, format: :json, id: product.id, api_key: @api_key)