class UrlViewsController < ApplicationController
  def index
    # This action will render the form for URL shortening
    @url = Url.new
  end
  
  def create
    # Generate a random short URL
    short_url = SecureRandom.alphanumeric(8)
    # Initialize a new Url object with params
    @url = Url.new(original_url: params[:original_url], short_url: short_url, click_count: 0)

    # Try to save the Url object
    if @url.save
      # Store the short URL in flash and redirect to index
      flash[:short_url] = @url.short_url
      redirect_to root_path
    else
      # Re-render the index view to display the errors
      render :index
    end
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
