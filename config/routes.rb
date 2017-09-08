Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index, :destroy] do
    resources :friendships
    resources :skills, only: [:new, :create, :show]
  end

  namespace :admin do
    resources :users do
      resources :skills
    end
  end

  root to: "home#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"


  post '/about', to: 'home#about'

  delete '/logout',  to: 'sessions#destroy'
end
