Rails.application.routes.draw do

  devise_for :users
  
  root 'static#home'

  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'

  resources :users do
    resources :zoos
  end

  resources :zoos do
    resources :animals
    resources :keepers
  end
  
  resources :users
  resources :keepers
  resources :animals
  resources :zoos
end
