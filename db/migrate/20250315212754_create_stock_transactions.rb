class CreateStockTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :stock_transactions do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.string :transaction_type

      t.timestamps
    end
  end
end
