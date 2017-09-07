Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :skills, only: [:new, :create, :show]
  end

  root to: "home#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
end
