Rails.application.routes.draw do
  resources :users

  get 'oauth/authorize', to: 'o_auth#authorize'
  get 'oauth/callback', to: 'o_auth#callback'

end
