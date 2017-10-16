json.data do
  json.array! @articles do |article|
    json.partial! 'api/v1/portfolio/articles/article', article: article
  end
end

json.count @articles.total_count

json.page do
  if @articles.present?
    json.per_page @articles.limit_value
    json.current_page @articles.current_page
    json.total_pages @articles.total_pages
    json.next_page api_v1_portfolio_articles_url(@articles,
                                                page: @articles.next_page,
                                                per_page: @articles.limit_value,
                                                format: :json, api_key: @api_key)

    json.prev_page api_v1_portfolio_articles_url(@articles,
                                                page: @articles.prev_page,
                                                per_page: @articles.limit_value,
                                                format: :json, api_key: @api_key)
  else
    json.nil!
  end
end