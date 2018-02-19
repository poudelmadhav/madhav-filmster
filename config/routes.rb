Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'main' => 'static_pages#index'

  get 'movies' => 'movies#index'

  resources :users, only: :show

  resources :movies do 
  	resources :reviews
  end
  resources :reviews

  root 'movies#index'
end
