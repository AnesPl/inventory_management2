class AddNoteToStockTransactions < ActiveRecord::Migration[8.0]
  def change
    add_column :stock_transactions, :note, :string
  end
end
