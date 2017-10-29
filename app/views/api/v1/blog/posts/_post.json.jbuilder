json.extract! post, :id, :title, :slug, :content, :status, :tags, :published_at, :image, :metadescription, :metakeywords, :metatitle, :created_at, :updated_at
json.user do
  json.extract! post.user, :id, :email
end
json.api api_v1_blog_post_url(post, format: :json, id: post.id, api_key: @api_key)