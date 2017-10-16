json.data do
  json.array! @projects do |project|
    json.partial! 'api/v1/portfolio/projects/project', project: project

    json.category do
      json.partial! 'api/v1/portfolio/categories/category', category: project.category
    end
    json.feedback do
      if project.feedback
        json.partial! 'api/v1/portfolio/feedbacks/feedback', feedback: project.feedback
      else
        json.nil!
      end
    end
  end
end

json.count @projects.total_count

json.page do
  if @projects.present?
    json.per_page @projects.limit_value
    json.current_page @projects.current_page
    json.total_pages @projects.total_pages
    json.next_page api_v1_portfolio_projects_url(@projects,
                                                 page: @projects.next_page,
                                                 per_page: @projects.limit_value,
                                                 format: :json,
                                                 api_key: @api_key)

    json.prev_page api_v1_portfolio_projects_url(@projects,
                                                 page: @projects.prev_page,
                                                 per_page: @projects.limit_value,
                                                 format: :json,
                                                 api_key: @api_key)
  else
    json.nil!
  end
end