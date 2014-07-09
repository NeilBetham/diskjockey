Rails.application.routes.draw do
  get 'oauth/authorize', to: 'o_auth#authorize'
  get 'oauth/callback', to: 'o_auth#callback'

end
