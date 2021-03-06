Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"

  require 'sidekiq/web'
  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index show]
    end
    namespace :v2 do
      resources :movies, only: %i[index show]
    end
    end
  mount Sidekiq::Web => "/sidekiq"

  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    resources :comments
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end
  resources :users, only: [] do
    collection do
      get :rating
    end
  end
end

