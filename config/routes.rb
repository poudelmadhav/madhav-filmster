Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'main' => 'static_pages#index'

  resources :users, only: [:show]

  resources :relationships, only: [:create, :destroy]

  resources :upvotes, only: [:create, :destroy]

  resources :movies

  resources :reviews

  get "timeline" => "static_pages#timeline"

  get 'user/timeline', to: 'users#timeline' # for timeline.json

  root 'movies#index'
end
