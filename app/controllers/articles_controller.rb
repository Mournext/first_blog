class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end
  # 需要放在除index方法后显示，否则其他方法会影响显示
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  # 抽象成控制器类的一个方法
  def create
    # render plain: params[article].inspect
    # @article = Article.new(params[:article])
    @article = Article.new(article_params)

    if @article.save
      # 重定向到生成的类实体变量
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  # 禁止外部调用此类
  def article_params
    # 安全性设置 为控制器参数设置白名单，以避免错误地批量赋值
    params.require(:article).permit(:title, :text)
  end


end
