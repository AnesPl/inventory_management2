class StockTransactionsController < ApplicationController
    before_action :set_product
  
    def new
      @stock_transaction = StockTransaction.new
    end
  
    def create
      @stock_transaction = @product.stock_transactions.new(stock_transaction_params)
  
      if @stock_transaction.save
        # Update the product's stock based on the transaction type and quantity
        if @stock_transaction.transaction_type == 'add'
          # Add to stock
          @product.update(stock: @product.stock + @stock_transaction.quantity)
        elsif @stock_transaction.transaction_type == 'subtract'
          # Subtract from stock
          @product.update(stock: @product.stock - @stock_transaction.quantity)
        end
  
        redirect_to @product, notice: 'Stock transaction was successfully created.'
      else
        render :new
      end
    end
  
    private
      def set_product
        @product = Product.find(params[:product_id])
      end
  
      def stock_transaction_params
        params.require(:stock_transaction).permit(:transaction_type, :quantity, :note)
      end
  end
  