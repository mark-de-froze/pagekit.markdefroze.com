json.data do
  json.array! @feedbacks do |feedback|
    json.partial! 'api/v1/portfolio/feedbacks/feedback', feedback: feedback

    json.project do
      json.partial! 'api/v1/portfolio/projects/project', project: feedback.project

      json.category do
        json.partial! 'api/v1/portfolio/categories/category', category: feedback.project.category
      end
    end
  end
end

json.count @feedbacks.total_count

json.page do
  if @feedbacks.present?
    json.per_page @feedbacks.limit_value
    json.current_page @feedbacks.current_page
    json.total_pages @feedbacks.total_pages
    json.next_page api_v1_portfolio_feedbacks_url(@feedbacks,
                                                page: @feedbacks.next_page,
                                                per_page: @feedbacks.limit_value,
                                                format: :json, api_key: @api_key)

    json.prev_page api_v1_portfolio_feedbacks_url(@feedbacks,
                                                page: @feedbacks.prev_page,
                                                per_page: @feedbacks.limit_value,
                                                format: :json, api_key: @api_key)
  else
    json.nil!
  end
end