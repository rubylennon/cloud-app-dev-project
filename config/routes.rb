Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :products
  root to: 'home#index'
  get 'home/about'
end
