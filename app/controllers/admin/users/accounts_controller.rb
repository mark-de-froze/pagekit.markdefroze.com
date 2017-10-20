class Admin::Users::AccountsController < AdminController
  load_and_authorize_resource param_method: :users_account_params, class: 'Users::Account'

  before_action :set_users_account, only: [:show, :edit, :update, :destroy]

  # GET /admin/users/accounts
  def index
    @search = params[:search].to_s.html_safe

    @users_accounts = Users::Account
                          .order(updated_at: :desc)
                          .search(:email, @search)
                          .page(params[:page])
  end

  # GET /admin/users/accounts/1
  def show
  end

  # GET /admin/users/accounts/new
  def new
    @users_account = Users::Account.new
  end

  # GET /admin/users/accounts/1/edit
  def edit
  end

  # POST /admin/users/accounts
  def create
    @users_account = Users::Account.new(users_account_params)

    if @users_account.save
      redirect_to @users_account, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/users/accounts/1
  def update
    if @users_account.update(users_account_params)
      redirect_to @users_account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/users/accounts/1
  def destroy
    @users_account.destroy
    redirect_to users_accounts_url, notice: 'Account was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_account
      @users_account = Users::Account.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def users_account_params
      if params.require(:users_account)[:password].blank? and params.require(:users_account)[:password_confirmation].blank?
        params.require(:users_account).permit(:email, :locale, { role_ids:[] })
      else
        params.require(:users_account).permit(:password, :password_confirmation, :email, :locale, { role_ids:[] })
      end
    end
end
