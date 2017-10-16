class Admin::Site::MailsController < AdminController
  authorize_resource param_method: :site_mail_params, class: 'Site::Mail'

  before_action :set_site_mail, only: [:show, :edit, :update, :destroy]

  # GET /admin/site/mails
  def index
    @search = params[:search].to_s.html_safe

    @site_mails = Site::Mail.unscoped
                      .order(:updated_at)
                      .api(@api_keys_array)
                      .search(:subject, @search)
                      .page(params[:page])
  end

  # GET /admin/site/mails/1
  def show
  end

  # GET /admin/site/mails/new
  def new
    @site_mail = Site::Mail.new
  end

  # GET /admin/site/mails/1/edit
  def edit
  end

  # POST /admin/site/mails
  def create
    @site_mail = Site::Mail.new(site_mail_params)

    if @site_mail.save
      redirect_to @site_mail, notice: 'Mail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/site/mails/1
  def update
    if @site_mail.update(site_mail_params)
      redirect_to @site_mail, notice: 'Mail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/site/mails/1
  def destroy
    @site_mail.destroy
    redirect_to site_mails_url, notice: 'Mail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_mail
      @site_mail = Site::Mail.unscoped.api(@api_keys_array).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def site_mail_params
      params.require(:site_mail).permit(:from_name, :from_email, :subject, :message, :status, :api_key)
    end
end
