class Api::V1::Blog::CommentsController < ApiController

  def show
    @blog_post_id = params[:id]
    @comments = Blog::Comment.api(@api_key).where(blog_post_id: @blog_post_id).page(params[:page])

    if params[:per_page].present?
      @comments = @comments.per(params[:per_page])
    end
  end
end