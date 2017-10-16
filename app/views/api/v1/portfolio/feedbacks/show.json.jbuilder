json.partial! 'api/v1/portfolio/feedbacks/feedback', feedback: @feedback

json.project do
  json.partial! 'api/v1/portfolio/projects/project', project: @feedback.project
  json.category do
    json.partial! 'api/v1/portfolio/categories/category', category: @feedback.project.category
  end
end