class Admin::Users::KeysController < AdminController
  load_and_authorize_resource param_method: :users_key_params, class: 'Users::Key'

  before_action :set_users_key, only: [:show, :edit, :update, :destroy]
  before_action :set_uploader, only: [:edit, :update]

  # GET /users/keys
  def index
    @search = params[:search].to_s.html_safe

    @users_keys = Users::Key
                      .order(updated_at: :desc)
                      .search(:title, @search)
                      .page(params[:page])
  end

  # GET /users/keys/1
  def show
  end

  # GET /users/keys/new
  def new
    @users_key = Users::Key.new
    @users_key.api_key = SecureRandom.hex
  end

  # GET /users/keys/1/edit
  def edit
  end

  # POST /users/keys
  def create
    @users_key = Users::Key.new(users_key_params)

    if @users_key.save
      redirect_to @users_key, notice: 'Key was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/keys/1
  def update
    if @users_key.update(users_key_params)
      redirect_to @users_key, notice: 'Key was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/keys/1
  def destroy
    @users_key.destroy
    redirect_to users_keys_url, notice: 'Key was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_key
      @users_key = Users::Key.find(params[:id])
    end

    def set_uploader
      @uploader = Site::File.new.name
      @uploader.success_action_redirect = new_site_file_url(redirect: edit_users_key_path(@users_key))

      @users_key.image = @uploader.direct_fog_url+params[:key] if params[:key].present?
    end

    # Only allow a trusted parameter "white list" through.
    def users_key_params
      params.require(:users_key).permit(:api_key, :site, :user_id, :title, :content, :image)
    end
end
