class AdminController < ApplicationController
  layout 'admin/application'
  before_action :authenticate_user!
  before_action :setup
  before_action :set_api_keys
  before_action :verify_admin

  private

  def setup
    action = params[:action]
    controller = params[:controller]
    section = (a = controller.split('/')).size >=3 ? a.slice!(0,a.size-1).join('/') : params[:controller]

    @menu_main = Menu.main
    @menu_sub = Menu.sub(section)

    @title = controller.split('/').last.titleize
    @title_section = section.split('/').last.titleize
    @controller = params[:controller]
  end

  def verify_admin
    redirect_to root_url unless current_user.has_role? :authenticated
  end

  def set_api_keys
    if current_user.has_role? :administrator
      @api_keys = Users::Key.all
      @api_keys_array = @api_keys.collect {|k| k.api_key }.compact
    else
      @api_keys = current_user.keys
      @api_keys_array = @api_keys.collect {|k| k.api_key }.compact
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to dashboard_url, alert: exception.message}
    end
  end
end
