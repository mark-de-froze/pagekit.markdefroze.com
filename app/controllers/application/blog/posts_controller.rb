class Application::Blog::PostsController < ApplicationController
  # GET /blog/posts
  def index
    @blog_posts = Blog::Post.api(@pagekit_api_key)
                              .order(updated_at: :desc)
                              .page(params[:page])
  end

  # GET /blog/posts/1
  def show
    @blog_post = Blog::Post.friendly.api(@pagekit_api_key).find(params[:id])

    @post_comments = @blog_post.comments.unscoped.order(updated_at: :desc)
    @blog_comment = Blog::Comment.new
    @blog_comment.blog_post_id = @blog_post.id
    @blog_comment.status = :unpublished
    @blog_comment.api_key = @blog_post.api_key
  end
end
