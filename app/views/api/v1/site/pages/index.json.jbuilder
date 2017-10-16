json.data do
  json.array! @pages do |page|
    json.partial! 'api/v1/site/pages/page', page: page
  end
end

json.count @pages.total_count

json.page do
  if @pages.present?
    json.per_page @pages.limit_value
    json.current_page @pages.current_page
    json.total_pages @pages.total_pages
    json.next_page api_v1_site_pages_url(@pages,
                                                page: @pages.next_page,
                                                per_page: @pages.limit_value,
                                                format: :json,
                                                api_key: @api_key)

    json.prev_page api_v1_site_pages_url(@pages,
                                                page: @pages.prev_page,
                                                per_page: @pages.limit_value,
                                                format: :json,
                                                api_key: @api_key)
  else
    json.nil!
  end
end