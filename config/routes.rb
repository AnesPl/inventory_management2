Rails.application.routes.draw do
  # Users Routes (Registration)
  get "users/new", to: "users#new", as: 'signup'  # Render the signup form
  post "users", to: "users#create"  # Handle user creation (registration)

  # Sessions Routes (Login/Logout)
  get 'login', to: 'sessions#new', as: 'login'  # Render the login form
  post 'login', to: 'sessions#create'  # Handle login
  delete 'logout', to: 'sessions#destroy', as: 'logout'  # Handle logout

  # Dashboard Route
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  # Root Route (Homepage)
  root "products#index"

  # Resourceful Routes for Categories and Products
  resources :users
  resources :categories
  resources :products do
    resources :stock_transactions, only: [:index, :new, :create]
  end

  # Admin Namespace for User Management and Product Management
  namespace :admin do
    resources :users, only: [:index, :destroy]  # Admin can see and delete users
    resources :categories
    resources :products
  end
end
