Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show, :index, :destroy] do
    resources :skills, only: [:new, :create, :show]
  end

  resources :friendships

  namespace :admin do
    resources :users do
      resources :skills
    end
  end

  root to: "home#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  get '/about', to: 'home#about'
  get '/founders', to: 'home#founders'


  delete '/logout',  to: 'sessions#destroy'
end
