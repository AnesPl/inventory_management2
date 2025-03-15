Rails.application.routes.draw do
  root "products#index"

  resources :categories
  resources :products do
  resources :stock_transactions, only: [:index, :new, :create]
  end
  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :categories
    resources :products
  end
end
