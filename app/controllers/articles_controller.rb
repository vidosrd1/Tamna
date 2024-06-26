class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
    if params[:tag_id]
      Tag.find(id).articles
    else
    @articles = Article.all.order('created_at DESC')
    end
    @pagy, @articles = pagy(@articles)
    if params[:query].present?
      @articles = #Article.ordered.paginate(:page => params[:page], :per_page => 10)
      #Article.recent_first.paginate(:page => params[:page], :per_page => 10)
      Article.where("title LIKE ?", "%#{params[:query]}%")
    end

    if turbo_frame_request?
      render partial: "articles", locals: { articles: @articles }
    else
      render :index
    end
  rescue Pagy::OverflowError
    #redirect_to root_path(page: 1)
    params[:page] = 1
    retry
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    #def article_params
    #  params.require(:article).permit(:user_id, :title, :name, :publish, :body)
    #end
    def article_params
      params.require(:article).permit(
        :title, :name, :image, :body,
        :publish, pictures: []
      ).with_defaults(user: current_user)
    end

    def current_user
      User.first
    end
end
