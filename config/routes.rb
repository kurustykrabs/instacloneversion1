Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'posts#index'
  # root to: 'pages#homepage'
  # get '/', to:'pages#homepage'
  root 'pages#homepage'
  # (alternative way here)

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  resources :users do
    member do
      get :followings
      get :followers
    end
  end

  resources :posts do
    resources :comments
  end

  resources :relationships
  end
