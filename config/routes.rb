Rails.application.routes.draw do
  # For URL shortening view
  root to: 'url_views#index'
  post '/shorten', to: 'url_views#create'
  
  # For admin view
  get '/admin', to: 'admin#index'

  # For API endpoints
  post '/urls', to: 'urls#create'
  get '/urls/:short_url', to: 'urls#show'
  get '/urls/:short_url/stats', to: 'urls#stats'

  # Route matcher for short URLs
  get '/:short_url', to: 'url_views#show'
end
