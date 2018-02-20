Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'main' => 'static_pages#index'

  resources :users do 
    resources :relationships, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy] 

  resources :movies

  resources :reviews

  root 'movies#index'
end
