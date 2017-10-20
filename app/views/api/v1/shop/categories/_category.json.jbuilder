json.extract! category, :id, :title, :slug, :content, :image, :created_at, :updated_at
json.api api_v1_shop_category_url(category, format: :json, id: category.id, api_key: @api_key)
