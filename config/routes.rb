Rails.application.routes.draw do
  resources :products
  root 'home#index'
  get 'home/about'
end
