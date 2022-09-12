Rails.application.routes.draw do
  get 'bookmarked_places/new'
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:index, :show]
  resources :cities, only: [:index, :show] do
    resources :tips, only: [:index, :new, :create]
    resources :bookmarked_places, only: [:create]
  end
  resources :companies, only: [:new, :create]
  resources :tips, only: [:destroy]
  resources :trips
  resources :bookmarked_places, only: [:index, :destroy]
end
