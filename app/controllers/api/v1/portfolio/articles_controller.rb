module Api
  module V1
    class Api::V1::Portfolio::ArticlesController < ApiController

      def index
        @articles = Api::Portfolio::Article.where(api_key: @api_key).friendly.page params[:page]

        if params[:per_page].present?
          @articles = @articles.per(params[:per_page])
        end
      end

      def show
        @article = Api::Portfolio::Article.friendly.find(params[:id])
      end
    end
  end
end
