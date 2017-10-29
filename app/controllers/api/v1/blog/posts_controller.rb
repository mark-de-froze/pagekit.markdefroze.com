class Api::V1::Blog::PostsController < ApiController

  def index
    @posts = Blog::Post.api(@api_key).friendly.page params[:page]

    if params[:per_page].present?
      @posts = @posts.per(params[:per_page])
    end
  end

  def show
    @post = Blog::Post.api(@api_key).friendly.find(params[:id])
    @comments = @post.comments.page(params[:page])

    if params[:per_page].present?
      @comments = @comments.per(params[:per_page])
    end
  end
end