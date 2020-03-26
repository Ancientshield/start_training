# frozen_string_literal: true

Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  # root :to => 'tasks#index'
  root to: 'tasks#index'
  resources :tasks do
    collection { post :search, to: 'tasks#index' }
  end
end
