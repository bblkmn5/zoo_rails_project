Rails.application.routes.draw do

  root 'static#home'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :zoos
  end
  
  resources :users
  resources :keepers
  resources :animals
  resources :zoos
  
end
