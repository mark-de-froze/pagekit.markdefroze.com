class Api::V1::Portfolio::ProjectsController < ApiController

  def index
    @projects = Portfolio::Project.api(@api_key).page(params[:page])

    if params[:per_page].present?
      @projects = @projects.per(params[:per_page])
    end
  end

  def show
    @project = Portfolio::Project.api(@api_key).friendly.find(params[:id])
  end
end