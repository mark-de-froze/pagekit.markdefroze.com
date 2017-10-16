json.array! @links do |link|
  json.partial! 'api/v1/site/links/link', link: link
end