class AddUserIdToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :user_id, :integer
  end
end
