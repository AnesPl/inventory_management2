class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :stock_transactions, dependent: :destroy

  def total_stock
    stock_transactions.sum("CASE WHEN transaction_type = 'add' THEN quantity ELSE -quantity END") + stock
  end
end
