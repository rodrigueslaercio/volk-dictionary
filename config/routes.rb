Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  root "api#index"
  post "api", to: "api#create", as: :api

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorite_words, only: [:create, :destroy]
 end
