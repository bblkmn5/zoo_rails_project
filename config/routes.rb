Rails.application.routes.draw do

  devise_for :users
  root 'static#home'

  resources :users do
    resources :zoos
  end
  
  resources :users
  resources :keepers
  resources :animals
  resources :zoos
  
end
