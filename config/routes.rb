Rails.application.routes.draw do
  # root :to => 'tasks#index'
  # 新寫法
  root to: 'tasks#index'
  resources :tasks
end
