json.array! @categories do |category|
  json.partial! 'api/v1/portfolio/categories/category', category: category

  json.subcategories do
    if category.subcategories.present?
      json.partial! 'api/v1/portfolio/categories/category', collection: category.subcategories, as: :category
    else
      json.nil!
    end
  end
end