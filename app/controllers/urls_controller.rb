class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # POST /urls
  def create
    # Generate a random short URL
    short_url = SecureRandom.alphanumeric(8)
    # Create a new Url record
    url = Url.create(original_url: params[:original_url], short_url: short_url, click_count: 0)
    # Return the short URL in the response
    render json: { short_url: url.short_url }
  end

  # GET /urls/:short_url
  def show
    # Find the Url record by short_url
    url = Url.find_by(short_url: params[:short_url])
    # Increment the click_count and return the original URL
    if url
      url.increment!(:click_count)
      render json: { original_url: url.original_url }
    else
      render json: { error: "URL not found" }, status: 404
    end
  end

  # GET /urls/:short_url/stats
  def stats
    # Find the Url record by short_url
    url = Url.find_by(short_url: params[:short_url])
    # Return the click_count
    if url
      render json: { click_count: url.click_count }
    else
      render json: { error: "URL not found" }, status: 404
    end
  end
end
