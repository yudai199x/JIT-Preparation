class Users::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @articles = current_user.articles
  end
  
  def show
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to users_article_url @article
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      redirect_to users_article_url @article
    else
      render :edit
    end
  end
  
  def destroy
    @article.destroy
    redirect_to users_articles_url
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :content, :image)
    end
    
    def set_article
      @article = current_user.articles.find_by(id: params[:id])
    end
end
