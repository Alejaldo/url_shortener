require 'rails_helper'

RSpec.describe "Admin", type: :request do
  let(:admin_username) { "admin" }
  let(:admin_password) { "password" }

  before do
    ENV['ADMIN_NAME'] = admin_username
    ENV['ADMIN_PASSWORD'] = admin_password
  end

  describe "GET /admin" do
    context "when correct credentials are provided" do
      it "grants access to the admin dashboard" do
        get "/admin", headers: { "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials(admin_username, admin_password) }
        expect(response).to have_http_status(200)
      end
    end

    context "when incorrect credentials are provided" do
      it "denies access to the admin dashboard" do
        get "/admin", headers: { "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials("wrong_username", "wrong_password") }
        expect(response).to have_http_status(401) # 401 Unauthorized
      end
    end
  end
end
