Rails.application.routes.draw do
  # For URL shortening view
  root to: 'url_views#index'
  post '/shorten', to: 'url_views#create'
  get '/:short_url', to: 'url_views#show'

  # For API endpoints
  post '/urls', to: 'urls#create'
  get '/urls/:short_url', to: 'urls#show'
  get '/urls/:short_url/stats', to: 'urls#stats'
end
