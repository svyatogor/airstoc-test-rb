class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    @categories = Category.all
    @categories = @categories.where(id: params[:ids]) if params[:ids]
    respond_with @categories
  end

  def show
    respond_with @category
  end

  def create
    @category = Category.create(category_params)
    respond_with @category
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    respond_with @category
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
