class CategoriesController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Category.all
  end

  def show
  end

  def new
    @item = Category.new
    @items = Category.all
  end

  def create
    @item = Category.new allow_params
    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def edit
    @items = Category.all
  end

  def update
    if @item.update allow_params
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def allow_params
      params.require(:category).permit(:name, :description, :parent_id)
    end

    def find_item
      @item = Category.find(params[:id])
    end
end
