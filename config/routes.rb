# frozen_string_literal: true

Rails.application.routes.draw do

  resources :profiles do
    member do
      resources :activities
    end
  end

  get 'home/access_denied'

  resources :orders
  get 'entries/index'
  get 'entries/show'
  resources :feeds
  devise_for :users
  resources :users, only: %i[index show edit update]
  resources :products
  resources :orders
  root to: 'home#index'
  get 'home/about'
  get 'search', to: 'products#search'

  get 'entries/index'
  get 'entries/show'

  resources :feeds do
    member do
      resources :entries, only: %i[index show]
    end
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'

  get 'rake_task', to: 'feeds#datafeed', as: 'my_rake_task'
end
