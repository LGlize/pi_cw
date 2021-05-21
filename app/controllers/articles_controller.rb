class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "putin", password: "vor", except: [:index, :show]

  def index
    @articles = Article.all
  end
 
  http_basic_authenticate_with name: "putin", password: "vor", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    # ...
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

    private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

    private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end

