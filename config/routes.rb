# frozen_string_literal: true

Rails.application.routes.draw do
  # root :to => 'tasks#index'
  # 新寫法
  root to: 'tasks#index'
  resources :tasks do
  end
  get '/search' => 'search#index', as: 'search'
end
