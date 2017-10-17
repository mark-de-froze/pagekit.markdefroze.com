class Admin::Site::WidgetsController < AdminController
  authorize_resource param_method: :site_widget_params, class: 'Site::Widget'

  before_action :set_site_widget, only: [:show, :edit, :update, :destroy]

  # GET /admin/site/widgets
  def index
    @search = params[:search].to_s.html_safe
    @position = params[:position].to_s.html_safe

    @site_widgets = Site::Widget.unscoped
                      .order(updated_at: :desc)
                      .api(@api_keys_array)
                      .search(:title, @search)
                      .page(params[:page])

    unless @position.empty?
      @site_widgets = @site_widgets.where(position: @position.downcase)
    end

    @site_widgets_positions = Site::Widget.new.positions_with_count
  end

  # GET /admin/site/widgets/1
  def show
  end

  # GET /admin/site/widgets/new
  def new
    @site_widget = Site::Widget.new
  end

  # GET /admin/site/widgets/1/edit
  def edit
  end

  # POST /admin/site/widgets
  def create
    @site_widget = Site::Widget.new(site_widget_params)

    if @site_widget.save
      redirect_to @site_widget, notice: 'Widget was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/site/widgets/1
  def update
    if @site_widget.update(site_widget_params)
      redirect_to @site_widget, notice: 'Widget was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/site/widgets/1
  def destroy
    @site_widget.destroy
    redirect_to site_widgets_url, notice: 'Widget was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_widget
      @site_widget = Site::Widget.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def site_widget_params
      params.require(:site_widget).permit(:api_key, :title, :subtitle, :content, :section, :status, :position)
    end
end
