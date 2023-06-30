class UrlViewsController < ApplicationController
  def index
    # This action will render the form for URL shortening
  end
  
  def create
    # Generate a random short URL
    short_url = SecureRandom.alphanumeric(8)
    # Create a new Url record
    url = Url.create(original_url: params[:original_url], short_url: short_url, click_count: 0)
    # Store the short URL in flash
    flash[:short_url] = url.short_url
    # Redirect to index
    redirect_to root_path
  end
  
  def show
    # Find the Url record by short_url
    url = Url.find_by(short_url: params[:short_url])
    # Increment the click_count and redirect to the original URL
    if url
      url.increment!(:click_count)
      redirect_to url.original_url, allow_other_host: true
    else
      render plain: "URL not found", status: 404
    end
  end
end
