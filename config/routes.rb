Rails.application.routes.draw do
  get 'bookmarked_users/new'
  get 'bookmarked_places/new'
  get 'companies/new'
  get 'tips/new'
  get 'trips/new'
  get 'cities/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
