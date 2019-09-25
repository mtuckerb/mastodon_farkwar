Rails.application.routes.draw do
  mount MastodonFarkwar::Engine => "/mastodon_farkwar"
end
