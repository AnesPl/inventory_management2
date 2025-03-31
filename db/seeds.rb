# db/seeds.rb

# Create a user first
user = User.create!(
  email: "anes.igrice10@gmail.com",
  password: "password",
  password_confirmation: "password"
)

# Now create a category
category = Category.create!(name: "Electronics", user: user)

# Now create a product under that category
product = Product.create!(
  name: "Laptop",
  price: 999.99,
  stock: 10,
  category: category,
  user: user
)

# Now create a stock transaction
StockTransaction.create!(
  product: product,
  quantity: 5,
  transaction_type: "add",
)
