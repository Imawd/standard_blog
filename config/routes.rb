Rails.application.routes.draw do
  resources :elements
  resources :comments
  devise_for :authors
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"

  get '/view/:id', to: 'posts#show', as: 'view'

  resources :authors
  resources :posts do
    resources :elements
    resources :comments
  end





end
