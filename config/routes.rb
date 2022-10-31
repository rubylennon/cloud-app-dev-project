Rails.application.routes.draw do
  devise_for :users
  resources :products
  root to: 'home#index'
  get 'home/about'
end
