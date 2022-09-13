Rails.application.routes.draw do
  get 'bookmarked_places/new'
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:index, :show]
  resources :cities, only: [:index, :show] do
    resources :tips, only: [:index, :create]
  end
  resources :bookmarked_places, only: [:index]
  resources :companies, only: [:new, :create]
  resources :tips, only: [:destroy] do
    resources :bookmarked_places, only: [:create, :destroy]
  end
  resources :trips
end
