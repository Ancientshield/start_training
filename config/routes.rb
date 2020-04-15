# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # root :to => 'tasks#index'
  root to: 'tasks#index'
  resources :tasks do
    collection { post :search, to: 'tasks#index' }
  end
  resources :users, param: :name, path: '/admin'
end
