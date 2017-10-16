json.partial! 'api/v1/portfolio/projects/project', project: @project

json.category do
  json.partial! 'api/v1/portfolio/categories/category', category: @project.category
end

json.feedback do
  if @project.feedback
    json.partial! 'api/v1/portfolio/feedbacks/feedback', feedback: @project.feedback
  else
    json.nil!
  end
end