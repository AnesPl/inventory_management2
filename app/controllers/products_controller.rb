class ProductsController < ApplicationController
    def index
      @products = Product.all
    end
  
    def show
        @product = Product.find(params[:id])
        @product.stock_transactions = @product.stock_transactions.order(created_at: :desc) # Optional: Order by date
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to @product, notice: "Product created successfully!"
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
        redirect_to @product, notice: "Product updated successfully!"
      else
        render :edit
      end
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path, notice: "Product deleted."
    end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :price, :stock, :category_id)
    end
  end
  