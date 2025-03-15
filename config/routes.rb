Rails.application.routes.draw do
  root "dashboard#index" # Landing page

  # User authentication (Devise or custom)
  devise_for :users

  # User dashboard - only accessible to logged-in users
  get "/dashboard", to: "dashboard#show"

  # Product & category management (only for logged-in users)
  resources :categories do
    resources :products, only: [:index, :new, :create] # Nested so products belong to categories
  end
  resources :products, except: [:index, :new, :create] # Manage individual products

  # Admin panel
  namespace :admin do
    resources :users, only: [:index, :show, :destroy] # Admin can see and delete users
    resources :categories, only: [:index, :destroy] # Admin can delete categories
    resources :products, only: [:index, :destroy] # Admin can delete products
  end
end
