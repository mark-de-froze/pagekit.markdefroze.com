json.array! @images do |image|
  json.partial! 'api/v1/portfolio/images/image', image: image
end