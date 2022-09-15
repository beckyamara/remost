Rails.application.routes.draw do
  get 'bookmarked_places/new'
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:index, :show]
  resources :cities, only: [:index, :show] do
    resources :tips, only: [:index, :create]
  end
  resources :bookmarked_places, only: [:index, :destroy]
  resources :companies, only: [:new, :create]
  resources :tips, only: [:destroy] do
    get 'favourite', to: "bookmarked_places#favourite"
  end
  resources :trips
end
