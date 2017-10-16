class Admin::Users::RolesController < AdminController
  load_and_authorize_resource param_method: :users_role_params, class: 'Users::Role'

  before_action :set_users_role, only: [:show, :edit, :update, :destroy]

  # GET /admin/users/roles
  def index
    @search = params[:search].to_s.html_safe

    @users_roles = Users::Role
                       .search(:name, @search)
                       .page(params[:page])
  end

  # GET /admin/users/roles/1
  def show
  end

  # GET /admin/users/roles/new
  def new
    @users_role = Users::Role.new
  end

  # GET /admin/users/roles/1/edit
  def edit
  end

  # POST /admin/users/roles
  def create
    @users_role = Users::Role.new(users_role_params)

    if @users_role.save
      redirect_to @users_role, notice: 'Role was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/users/roles/1
  def update
    if @users_role.update(users_role_params)
      redirect_to @users_role, notice: 'Role was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/users/roles/1
  def destroy
    @users_role.destroy
    redirect_to users_roles_url, notice: 'Role was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_role
      @users_role = Users::Role.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def users_role_params
      params[:users_role][:resource_type] = nil unless params[:users_role][:resource_type].present?

      params.require(:users_role).permit(:name, :resource_id, :resource_type)
    end
end
