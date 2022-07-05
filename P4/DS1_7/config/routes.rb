Rails.application.routes.draw do
  resources :participas
  resources :partidas
  resources :usuarios
  resources :torneos

  #resources :usuarios, param: :nombre

  resources :juega_individuals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  namespace :api, defaults: { format: 'json' }  do
    namespace :v1 do
      resources :usuarios
      resources :torneos
      resources :juega_individuals
      resources :participas
    end 
  end
  # Defines the root path route ("/")
  # root "articles#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  get "listatorneos", to: "listatorneos#new"
  get "mispartidas", to: "mispartidas#new"
  get "puntuaciones", to: "puntuaciones#new"

  get "registro", to: "registro#new"
  post "registro", to: "registro#create"

  delete "logout", to: "sessions#destroy" 

  root to: "principal#index"


end