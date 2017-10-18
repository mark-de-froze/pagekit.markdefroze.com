class Admin::Blog::CommentsController < AdminController
  authorize_resource param_method: :blog_comment_params, class: 'Blog::Comment'

  before_action :set_blog_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_blog_posts, only: [:new, :create, :edit, :update]

  # GET /blog/comments
  def index
    @search = params[:search].to_s.html_safe

    @blog_comments = Blog::Comment.unscoped
                         .api(@api_keys_array)
                         .search(:title, @search)
                         .order(updated_at: :desc)
                         .page(params[:page])
  end

  # GET /blog/comments/1
  def show
  end

  # GET /blog/comments/new
  def new
    @blog_comment = Blog::Comment.new
  end

  # GET /blog/comments/1/edit
  def edit
  end

  # POST /blog/comments
  def create
    @blog_comment = Blog::Comment.new(blog_comment_params)

    if @blog_comment.save
      redirect_to blog_post_url(@blog_comment.post, :anchor => "comment#{@blog_comment.id}") , notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blog/comments/1
  def update
    if @blog_comment.update(blog_comment_params)
      redirect_to blog_post_url(@blog_comment.post, :anchor => "comment#{@blog_comment.id}"), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blog/comments/1
  def destroy
    @blog_post = @blog_comment.post
    @blog_comment.destroy
    redirect_to blog_post_url(@blog_post, :anchor => "comments"), notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_comment
      @blog_comment = Blog::Comment.unscoped.api(@api_keys_array).find(params[:id])
    end

    def set_blog_posts
      @posts = Blog::Post.api(@api_keys_array)
    end

    # Only allow a trusted parameter "white list" through.
    def blog_comment_params
      params.require(:blog_comment).permit(:api_key, :from_name, :from_email, :comment, :status, :blog_post_id)
    end
end
