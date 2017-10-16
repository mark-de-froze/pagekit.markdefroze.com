json.extract! article, :id, :title, :slug, :content, :status, :tags, :published_at, :created_at, :updated_at
json.api api_v1_portfolio_article_url(article, format: :json, id: article.id, api_key: @api_key)
