class ArticlesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response







    def index
        render json: Article.all
    end

    def show
        render json:Article.find(params[:id])
    end

    def update
        article =Article.find(params[:id])
        article.update!(article_params)
        render json: article
    end

    def destroy
        Article.find(params[:id]).destroy
        head :no_content
    end

    def create
        article = Article.create!(article_params)
        render json: article, status: :created
    end

    private

    def article_params
        params.permit(:title , :comment , :picture)
    end

    private

  def render_not_found_response
    render json:{ error:"Artcle Not Found"}, status: :not_found
  end

  def render_unprocessable_entity_response
    render json:{ errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
