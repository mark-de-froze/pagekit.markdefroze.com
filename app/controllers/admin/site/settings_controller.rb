class Admin::Site::SettingsController < AdminController
  authorize_resource param_method: :site_setting_params, class: 'Site::Setting'

  before_action :set_site_setting, only: [:show, :edit, :update, :destroy]

  # GET /admin/site/settings
  def index
    @search = params[:search].to_s.html_safe

    @site_settings = Site::Setting
                         .api(@api_keys_array)
                         .search(:key, @search)
                         .page(params[:page])
  end

  # GET /admin/site/settings/1
  def show
  end

  # GET /admin/site/settings/new
  def new
    @site_setting = Site::Setting.new
  end

  # GET /admin/site/settings/1/edit
  def edit
  end

  # POST /admin/site/settings
  def create
    @site_setting = Site::Setting.new(site_setting_params)

    if @site_setting.save
      redirect_to @site_setting, notice: 'Setting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/site/settings/1
  def update
    if @site_setting.update(site_setting_params)
      redirect_to @site_setting, notice: 'Setting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/site/settings/1
  def destroy
    @site_setting.destroy
    redirect_to site_settings_url, notice: 'Setting was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_setting
      @site_setting = Site::Setting.api(@api_keys_array).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def site_setting_params
      params.require(:site_setting).permit(:api_key, :key, :value, :section)
    end
end
