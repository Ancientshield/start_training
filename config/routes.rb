# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  post '/change', to: 'sessions#change_user'

  # root :to => 'tasks#index'
  root to: 'tasks#index'
  resources :tasks do
    collection { post :search, to: 'tasks#index' }
  end
  resources :users, param: :name, path: '/admin'

  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessable_entity'
  match '/500', via: :all, to: 'errors#server_error'
end
