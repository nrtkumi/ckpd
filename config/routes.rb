Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes do
    member do
      resources :reviews
      post '/fav' => 'favorites#fav'
    end
    collection { get "search" }
  end
  get '/favorite' => 'favorites#index'
end
