class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin_or_owner, only: [:destroy]  # Admin or category owner can delete

  def index
    if current_user.admin?
      @categories = Category.all  # Admin sees all categories
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
    @category = current_user.categories.build(category_params) # Assuming category is associated with a user
  
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
    # Delete all products associated with the category
    @category.products.destroy_all

    # Now delete the category
    @category.destroy

    redirect_to categories_path, notice: 'Category and all associated products were successfully deleted.'
  end
  
  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def authorize_admin_or_owner
    # Admin can delete any category
    if current_user.admin?
      return true
    # Regular users can only delete their own categories
    elsif current_user != @category.user
      redirect_to categories_path, alert: "You do not have permission to delete this category!"
    end
  end
end
