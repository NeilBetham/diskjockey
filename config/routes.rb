Rails.application.routes.draw do
  resources :dj_applications

  resources :discrepancy_logs

  resources :shows

  resources :users

  resources :song_logs

  get 'oauth/authorize', to: 'o_auth#authorize'
  get 'oauth/callback', to: 'o_auth#callback'

end
