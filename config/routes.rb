Rails.application.routes.draw do

  devise_for :users, path: 'users', path_names: { sign_up: 'sign_up'}, :controllers => {:sessions => "users/sessions", :registrations => "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'static#home', as: 'root'
  get 'users/:id' => 'users#show', as: 'user'
  get 'zoos/other_zoo' => 'zoos#other_zoo', as: 'other_zoos'

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
