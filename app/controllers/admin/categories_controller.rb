module Admin
    class CategoriesController < ApplicationController
      before_action :authenticate_admin
  
      def index
        @categories = Category.all
      end
  
      def show
        @category = Category.find(params[:id])
        @products = @category.products
      end
  
      def new
        @category = Category.new
      end
  
      def create
        @category = Category.new(category_params)
        if @category.save
          redirect_to admin_categories_path, notice: "Category created successfully!"
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
          redirect_to admin_categories_path, notice: "Category updated successfully!"
        else
          render :edit
        end
      end
  
      def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to admin_categories_path, notice: "Category deleted successfully!"
      end
  
      private
  
      def category_params
        params.require(:category).permit(:name)
      end
  
      def authenticate_admin
        # Add admin authentication logic here
      end
    end
  end
  