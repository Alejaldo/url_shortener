require 'rails_helper'

RSpec.describe "UrlViews", type: :request do

  # Test for GET UrlViewsController#index
  describe "GET #index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  # Test for POST UrlViewsController#create
  describe "POST #create" do
    it "creates a new shortened URL and redirects" do
      post "/shorten", params: { original_url: 'https://example.com' }
      expect(response).to have_http_status(:redirect)
      follow_redirect!
      expect(response.body).to include("Shortened URL")
    end
  end
end
