class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  # def create
  #   Article.create(params[:article][:title])
  # end

  def create
    @article = Article.new(article_params)
    @article.save
    set_flash_notice("created")
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    set_flash_notice("deleted")
    redirect_to articles_path
  end

  def edit

  end

  def update
    @article.update(article_params)
    set_flash_notice("updated")
    redirect_to article_path(@article)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_flash_notice(action)
    flash.notice = "#{@article.title} has been " + "#{action}."
  end

  private



  def article_params
    params.require(:article).permit(:title, :body)
  end
end
