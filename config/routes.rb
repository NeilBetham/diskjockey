Rails.application.routes.draw do

  namespace :api do
    post 'token/get'
    delete 'token/destroy'
  end

  namespace :api do

  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'dashboard/index'

  resources :sessions, only: %w(new create destroy)

  resources :sub_lists

  resources :dj_schedules

  resources :dj_applications

  resources :discrepancy_logs

  resources :shows

  resources :users

  resources :song_logs

  root to: 'dashboard#index'
end
