class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:destroy]  # Admin can delete any category
  def index
    if current_user.admin?
      @categories = Category.all  # Admin sees all products
    else
      @categories = current_user.categories  # Regular users see only their own
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params) # Assuming the category is associated with a user
  
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: "Category updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Category deleted."
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end

  def authorize_admin
    redirect_to root_path, alert: "Access denied!" unless current_user.admin?
  end
end
