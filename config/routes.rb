Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
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
  delete '/logout',  to: 'sessions#destroy'
end
