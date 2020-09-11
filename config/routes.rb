Rails.application.routes.draw do
  # get 'startup/index'
  #resources :welcomes
  root 'welcomes#new', as: 'home'
  
  resources :songs
  resources :users
  resources :reviews, except: [:new]
  resources :recordings
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/recordings/:id/reviews/new', to:'reviews#new', as:'new_review'

  get '/sessions/new', to:'sessions#new', as:'new_login'
  post '/login', to:'sessions#create', as:'login'
  get '/logout', to:'sessions#destroy', as:'logout'
  get '/search', to: 'recordings#search', as: 'recording_search'
  


end
