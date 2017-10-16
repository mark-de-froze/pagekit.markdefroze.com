json.extract! image, :id, :title, :content, :image, :created_at, :updated_at
json.api api_v1_portfolio_image_url(image, format: :json, api_key: @api_key)