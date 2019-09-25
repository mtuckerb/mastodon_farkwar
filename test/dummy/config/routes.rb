Rails.application.routes.draw do
  resources :users
  mount MastodonFarkwar::Engine => "/mastodon_farkwar"
end
