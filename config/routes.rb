Rails.application.routes.draw do
  #resources :welcomes
  root 'welcomes#new', as: 'home'
  
  resources :songs
  resources :users
  resources :reviews
  resources :recordings
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/sessions/new', to:'sessions#new', as:'new_login'
  post '/login', to:'sessions#create', as:'login'
  post '/logout', to:'sessions#destroy', as:'logout'

  get '/search', to: 'recordings#search', as: 'recording_search'
  
end
