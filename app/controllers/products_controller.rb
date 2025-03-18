class ProductsController < ApplicationController
  before_action :require_login  # Ensure user is logged in
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @products = Product.all  # Admin sees all products
    else
      @products = current_user.products  # Regular users see only their own
    end
  end

  def show
    # The product is already set by the before_action, no need to repeat
    @product.stock_transactions = @product.stock_transactions.order(created_at: :desc) # Optional: Order by date
  end

  def new
    @product = current_user.products.build  # Build new product for the current user
    @categories = current_user.categories  # Only show categories for the current user
  end

  def create
    @product = current_user.products.build(product_params)  # Build product for the current user
    if @product.save
      redirect_to @product, notice: "Product created successfully!"
    else
      render :new
    end
  end

  def edit
    # The product is already set by the before_action, no need to repeat
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    # Delete the product
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = current_user.products.find(params[:id])  # Fetch the product owned by the current user
  end

  def product_params
    params.require(:product).permit(:name, :price, :stock, :category_id)
  end
end
