class Admin::Blog::PostsController < AdminController
  include Uploader

  authorize_resource param_method: :blog_post_params, class: 'Blog::Post'

  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :set_authors, only: [:new, :create, :edit, :update]
  before_action :set_uploader, only: [:new, :create, :edit, :update]
  before_action :set_image, only: [:edit]

  # GET /blog/posts
  def index
    @search = params[:search].to_s.html_safe

    @blog_posts = Blog::Post.unscoped
                              .api(@api_keys_array)
                              .search(:title, @search)
                              .order(updated_at: :desc)
                              .page(params[:page])
  end

  # GET /blog/posts/1
  def show
    @post_comments = @blog_post.comments.unscoped.order(updated_at: :desc)
    @blog_comment = Blog::Comment.new
    @blog_comment.blog_post_id = @blog_post.id
    @blog_comment.status = :unpublished
    @blog_comment.api_key = @blog_post.api_key
  end

  # GET /blog/posts/new
  def new
    @blog_post = Blog::Post.new
    set_image
    set_user
  end

  # GET /blog/posts/1/edit
  def edit
  end

  # POST /blog/posts
  def create
    @blog_post = Blog::Post.new(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blog/posts/1
  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blog/posts/1
  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = Blog::Post.unscoped.friendly.api(@api_keys_array).find(params[:id])
    end

    def set_image
      @blog_post.image = image_url
    end

    def set_authors
      if current_user.has_role? :administrator
        @authors = User.all
      else
        @authors = User.joins(:keys).where('keys.api_key IN (?)', @api_keys_array)
      end
    end

    def set_user
      @blog_post.user = current_user if @blog_post.user.nil?
    end

    # Only allow a trusted parameter "white list" through.
    def blog_post_params
      params.require(:blog_post).permit(:api_key, :title, :slug, :content, :status, :user_id, :tags, :published_at, :image, :metatitle, :metakeywords, :metadescription)
    end
end
