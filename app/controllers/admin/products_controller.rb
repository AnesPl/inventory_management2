module Admin
    class ProductsController < ApplicationController
      before_action :authenticate_admin
  
      def index
        @products = Product.all
      end
  
      def show
        @product = Product.find(params[:id])
      end
  
      def new
        @product = Product.new
      end
  
      def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to admin_products_path, notice: "Product created successfully!"
        else
          render :new
        end
      end
  
      def edit
        @product = Product.find(params[:id])
      end
  
      def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
          redirect_to admin_products_path, notice: "Product updated successfully!"
        else
          render :edit
        end
      end
  
      def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path, notice: "Product deleted successfully!"
      end
  
      private
  
      def product_params
        params.require(:product).permit(:name, :price, :stock, :category_id)
      end
  
      def authenticate_admin
        # Add admin authentication logic here
      end
    end
  end
  