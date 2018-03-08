Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'static#home', as: 'root'

  get 'other_zoos' => 'zoos#other_zoo', as: 'other_zoos'
  get 'users/all_animals' => 'animals#index', as: 'all_animals'
  get 'users/all_keepers' => 'keepers#index', as: 'all_keepers'

  resources :users, only: [:show] do
    resources :zoos
    resources :animals do
      resources :comments
    end
    resources :keepers
  end
end
