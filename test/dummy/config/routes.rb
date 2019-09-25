Rails.application.routes.draw do
  resources :accounts
  resources :users
  mount MastodonFarkwar::Engine => "/mastodon_farkwar"
end
