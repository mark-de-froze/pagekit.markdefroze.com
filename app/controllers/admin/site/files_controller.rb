class Admin::Site::FilesController < AdminController
  authorize_resource param_method: :site_file_params, class: 'Site::File'

  before_action :set_site_file, only: [:show, :destroy]
  before_action :set_total_size, only: [:index]

  # GET /admin/site/files
  def index
    @search = params[:search].to_s.html_safe

    @site_files = Site::File
                      .order(updated_at: :desc)
                      .api(@api_keys_array)
                      .search(:name, @search)
                      .page(params[:page])

    @uploader = Site::File.new.name
    @uploader.success_action_redirect = new_site_file_url
  end

  # GET /admin/site/files/1
  def show
  end

  # GET /admin/site/files/new
  def new
    if params[:key].present?
      @site_file = Site::File.new

      @site_file.name_key = params[:key]

      s3_file = Aws::S3::Client.new.get_object({bucket: ENV.fetch('S3_BUCKET_NAME'), key: @site_file.name_key})

      @site_file.modified = s3_file.last_modified.to_time.to_i
      @site_file.size = s3_file.content_length
    else
      redirect_to site_files_url, alert: 'Invalid file key.'
    end
  end

  def create
    @site_file = Site::File.new(site_file_params)

    if params[:site_file][:redirect].empty?
      @redirect_url = site_files_url
    else
      @redirect_url = params[:site_file][:redirect]+'?key='+@site_file.name_key
    end

    if @site_file.save
      redirect_to @redirect_url, notice: 'File was successfully created.'
    else
      render :new
    end
  end

  # DELETE /admin/site/files/1
  def destroy
    Aws::S3::Client.new.delete_object({bucket: ENV.fetch('S3_BUCKET_NAME'), key: @site_file.name_key})

    @site_file.destroy
    redirect_to site_files_url, notice: 'File was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_file
      @site_file = Site::File.find(params[:id])
    end

    def set_total_size
      @total_size = Site::File.sum(:size)
    end

    # Only allow a trusted parameter "white list" through.
    def site_file_params
      params.require(:site_file).permit(:api_key, :name, :name_key, :size, :modified)
    end
end
