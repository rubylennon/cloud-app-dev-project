Rails.application.routes.draw do
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

  get 'entries/index'
  get 'entries/show'

end
