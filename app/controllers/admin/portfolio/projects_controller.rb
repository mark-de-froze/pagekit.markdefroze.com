class Admin::Portfolio::ProjectsController < AdminController
  include Uploader

  authorize_resource param_method: :portfolio_project_params, class: 'Portfolio::Project'

  before_action :set_portfolio_project, only: [:show, :edit, :update, :destroy]
  before_action :set_uploader, only: [:new, :create, :edit, :update]
  before_action :set_image, only: [:edit]

  def render(*args)
    set_image if @_action_name == 'new'
    super
  end

  # GET /admin/portfolio/projects
  def index
    @search = params[:search].to_s.html_safe

    @portfolio_projects = Portfolio::Project.unscoped
                              .api(@api_keys_array)
                              .search(:title, @search)
                              .order(updated_at: :desc)
                              .page(params[:page])
  end

  # GET /admin/portfolio/projects/1
  def show
  end

  # GET /admin/portfolio/projects/new
  def new
    @portfolio_project = Portfolio::Project.new
  end

  # GET /admin/portfolio/projects/1/edit
  def edit
  end

  # POST /admin/portfolio/projects
  def create
    @portfolio_project = Portfolio::Project.new(portfolio_project_params)

    if @portfolio_project.save
      redirect_to @portfolio_project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/portfolio/projects/1
  def update
    if @portfolio_project.update(portfolio_project_params)
      redirect_to @portfolio_project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/portfolio/projects/1
  def destroy
    @portfolio_project.destroy
    redirect_to portfolio_projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_project
      @portfolio_project = Portfolio::Project.unscoped.friendly.api(@api_keys_array).find(params[:id])
    end

    def set_image
      @portfolio_project.image = image_url
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_project_params
      params.require(:portfolio_project).permit(:api_key, :title, :subtitle, :slug, :content, :status, :priority, :customer, :portfolio_category_id, :published_at, :metatitle, :metakeywords, :metadescription, :image, images_attributes: [ :id, :title, :content ] )
    end
end
