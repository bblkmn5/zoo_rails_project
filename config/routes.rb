Rails.application.routes.draw do

  devise_for :users, :controllers => {:sessions => "users/sessions", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'static#home', as: 'root'
  get 'users/:id' => 'users#show', as: 'user'

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
