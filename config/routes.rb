Rails.application.routes.draw do
  get 'bookmarked_places/new'
  devise_for :users, :controllers => { :registrations => "my_devise/registrations" }
  root to: "pages#home"
  resources :users, only: [:index, :show]
  resources :steps, only: [:show, :update], controller: 'user_steps'
  resources :cities, only: [:index, :show] do
    resources :tips, only: [:index, :create]
  end
  resources :bookmarked_places, only: [:index] do
    get 'unfavourite', to: "bookmarked_places#unfavourite"
  end
  resources :place, only: [:destroy] do
    get 'favourite', to: "bookmarked_places#favourite"
  end
  resources :companies, only: [:new, :create]
  resources :trips
end
