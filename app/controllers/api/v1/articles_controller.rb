class Api::V1::ArticlesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_article, only: [ :show, :update, :destroy ]
  def index
    @articles = policy_scope(Article)
  end

  def show
  end

  def update
    if  @article.update(article_params)
      render :show
    else
      render_error
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

  def set_article
    @article = Article.find(params[:id])
    authorize @article  # For Pundit
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def render_error
    render json: { errors: @article.errors.full_messages },
      status: :unprocessable_entity
  end
end
