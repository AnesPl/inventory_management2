class StockTransaction < ApplicationRecord
  belongs_to :product

  validates :transaction_type, presence: true, inclusion: { in: ['add', 'subtract'] }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
