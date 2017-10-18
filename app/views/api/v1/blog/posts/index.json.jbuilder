json.data do
  json.array! @posts do |post|
    json.partial! 'api/v1/blog/posts/post', post: post
  end
end

json.count @posts.total_count

json.page do
  if @posts.present?
    json.per_page @posts.limit_value
    json.current_page @posts.current_page
    json.total_pages @posts.total_pages
    json.next_page api_v1_blog_posts_url(@posts,
                                                 page: @posts.next_page,
                                                 per_page: @posts.limit_value,
                                                 format: :json, api_key: @api_key)

    json.prev_page api_v1_blog_posts_url(@posts,
                                                 page: @posts.prev_page,
                                                 per_page: @posts.limit_value,
                                                 format: :json, api_key: @api_key)
  else
    json.nil!
  end
end