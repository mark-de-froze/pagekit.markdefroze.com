json.data do
  json.array! @comments do |comment|
    json.extract! comment, :id, :from_name, :from_email, :gravatar_url, :comment
  end
end

json.count @comments.total_count

json.page do
  if @comments.present?
    json.per_page @comments.limit_value
    json.current_page @comments.current_page
    json.total_pages @comments.total_pages
    json.next_page api_v1_blog_comment_url(@blog_post_id,
                                         page: @comments.next_page,
                                         per_page: @comments.limit_value,
                                         format: :json, api_key: @api_key)

    json.prev_page api_v1_blog_comment_url(@blog_post_id,
                                         page: @comments.prev_page,
                                         per_page: @comments.limit_value,
                                         format: :json, api_key: @api_key)
  else
    json.nil!
  end
end