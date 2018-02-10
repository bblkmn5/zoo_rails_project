Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'static#home', as: 'root'

  resources :users do
    resources :zoos
  end

  resources :zoos do
    resources :animals
    resources :keepers
  end
  
  resources :users
  resources :sessions
  resources :keepers
  resources :animals
  resources :zoos
end
