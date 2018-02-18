Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'static#home', as: 'root'

  get 'zoos/other_zoo' => 'zoos#other_zoo', as: 'other_zoos'

  resources :users, only: [:show] do
    resources :zoos
    resources :animals
    resources :keepers
  end

  resources :zoos do
    resources :animals
    resources :keepers
  end
  
  resources :zoos
  resources :animals
  resources :keepers
end
