Rails.application.routes.draw do
  resources :orders
  resources :categories
  get 'entries/index'
  get 'entries/show'
  resources :feeds
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :products
  root to: 'home#index'
  get 'home/about'
  get 'search', to: "products#search"

  resources :feeds do
    member do
      resources :entries, only: [:index, :show]
    end
  end

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end

  get 'entries/index'
  get 'entries/show'

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

end
