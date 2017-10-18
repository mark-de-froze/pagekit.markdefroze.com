json.extract! project, :id, :title, :subtitle, :slug, :content, :priority, :status, :customer, :image, :metadescription, :metakeywords, :metatitle, :published_at
json.images do
  json.array! project.images do |image|
    json.partial! 'api/v1/portfolio/images/image', image: image
  end
end
json.api api_v1_portfolio_project_url(project, format: :json, id: project.id, api_key: @api_key)