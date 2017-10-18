module Uploader
  def set_uploader
    @uploader = Site::File.new.name
    @uploader.success_action_redirect = new_site_file_url(redirect: request.path)
  end

  def image_url
    @uploader.direct_fog_url + params[:key] if params[:key].present?
  end
end