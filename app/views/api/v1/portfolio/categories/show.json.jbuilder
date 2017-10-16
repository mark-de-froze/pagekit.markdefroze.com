json.partial! 'api/v1/portfolio/categories/category', category: @category

json.parent do
  if @category.parent
    json.partial! 'api/v1/portfolio/categories/category', category: @category.parent
  else
    json.nil!
  end
end

json.subcategories do
  if @category.subcategories.present?
    json.partial! 'api/v1/portfolio/categories/category', collection: @category.subcategories, as: :category
  else
    json.nil!
  end
end

json.projects do
  json.data do
    if @projects.present?
      json.partial! 'api/v1/portfolio/projects/project', collection: @projects, as: :project
    else
      json.nil!
    end
  end

  json.count @projects.total_count

  json.page do
    if @projects.present?
      json.per_page @projects.limit_value
      json.current_page @projects.current_page
      json.total_pages @projects.total_pages
      json.next_page api_v1_portfolio_category_url(@category,
                                                   id: @category.id,
                                                   page: @projects.next_page,
                                                   per_page: @projects.limit_value,
                                                   format: :json, api_key: @api_key)

      json.prev_page api_v1_portfolio_category_url(@category,
                                                   id: @category.id,
                                                   page: @projects.prev_page,
                                                   per_page: @projects.limit_value,
                                                   format: :json, api_key: @api_key)
    else
      json.nil!
    end
  end
end