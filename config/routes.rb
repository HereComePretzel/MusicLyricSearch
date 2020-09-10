Rails.application.routes.draw do
  get 'startup/index'
  #resources :welcomes
  root 'welcomes#new', as: 'home'
  
  resources :songs
  resources :users
  resources :reviews
  resources :recordings
  resources :artists
  resources :testfolders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/sessions/new', to:'sessions#new', as:'new_login'
  post '/login', to:'sessions#create', as:'login'
  get '/logout', to:'sessions#destroy', as:'logout'

end
