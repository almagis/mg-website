class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  
  
  
  def index
    @categories = Category.all.order("name DESC")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def delete
  end
  
  private
    def set_category
      @category = Category.find(params[:id])
    end
end
