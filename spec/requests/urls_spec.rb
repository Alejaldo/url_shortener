require 'rails_helper'

RSpec.describe "Urls", type: :request do
  # Test for POST /urls
  describe "POST /urls" do
    it "creates a new shortened URL" do
      post '/urls', params: { original_url: 'https://example.com' }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to have_key('short_url')
    end
  end

  # Test for GET /urls/:short_url
  describe "GET /urls/:short_url" do
    it "retrieves the original URL and increments click count" do
      # Create a Url record
      url = Url.create(original_url: 'https://example.com', short_url: 'abcd1234', click_count: 0)
      # Make the request
      get "/urls/#{url.short_url}"
      # Check the response
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['original_url']).to eq('https://example.com')
      # Check that the click_count has incremented
      expect(url.reload.click_count).to eq(1)
    end
  end

  # Test for GET /urls/:short_url/stats
  describe "GET /urls/:short_url/stats" do
    it "retrieves the click count for a URL" do
      # Create a Url record with click_count of 1
      url = Url.create(original_url: 'https://example.com', short_url: 'abcd1234', click_count: 1)
      # Make the request
      get "/urls/#{url.short_url}/stats"
      # Check the response
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['click_count']).to eq(1)
    end
  end
end
