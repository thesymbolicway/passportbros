Rails.application.routes.draw do
  resources :comments, only: [:index, :show, :create, :update, :destroy]
  resources :reviews, only: [:index, :create, :update, :destroy]
  resources :points, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :create, :update]
  resources :places, only: [:index, :show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 # Custom route for showing reviews attached to specific point of interest
 get '/reviews/:point_id', to: 
 'reviews#specific_point'
 # Defines the root path route ("/")
 # root "articles#index"
 get '*path',
     to: 'fallback#index',
     constraints: ->(req) { !req.xhr? && req.format.html? }
end