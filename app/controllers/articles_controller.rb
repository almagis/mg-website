class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]


  def index
    if params[:category].blank?
      # @articles vairable with pagination and without category filter
      @articles = Article.all.paginate(page: params[:page], per_page: 10).order("created_at DESC")
    else
      # Category varviables
      @category_id = params[:category]
      @category_name = Category.find(@category_id).name
      # @articles variable with category filter and pagination
      @articles = Article.where(:category_id => @category_id).paginate(page: params[:page], per_page: 10).order("created_at DESC")
    end
  end


  def show
  end

  
  def new
    # Assign global variables
    @article = current_user.articles.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  
  def create
    # Global variables
    @article = current_user.articles.build(article_params)
    @article.category_id = params[:category_id]

    # Article save functionality
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.', change: true }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    # global variable
    @article.category_id = params[:category_id]
    # Article update functionality
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # Private methods
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :category_id, :article_img, :summary)
    end
end
