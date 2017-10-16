json.extract! feedback, :id, :content, :status, :published_at, :created_at, :updated_at
json.api api_v1_portfolio_feedback_url(feedback, format: :json, api_key: @api_key)
