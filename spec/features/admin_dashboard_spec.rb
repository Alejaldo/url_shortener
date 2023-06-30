require 'rails_helper'

RSpec.feature "AdminDashboard", type: :feature do
  let(:admin_username) { "admin" }
  let(:admin_password) { "password" }

  before do
    ENV['ADMIN_NAME'] = admin_username
    ENV['ADMIN_PASSWORD'] = admin_password
    # Create a sample Url record
    Url.create(original_url: 'https://example.com', short_url: 'abcd1234', click_count: 5)
  end

  scenario "admin accesses the dashboard with correct credentials" do
    # Authorize with correct credentials
    auth = ActionController::HttpAuthentication::Basic.encode_credentials(admin_username, admin_password)
    page.driver.header('Authorization', auth)
    
    # Visit the admin dashboard page
    visit "/admin"

    # Expect the page to display the dashboard
    expect(page).to have_content("Admin Dashboard")
    expect(page).to have_selector("table")
    expect(page).to have_content("Short URL")
    expect(page).to have_content("Original URL")
    expect(page).to have_content("Click Count")
    expect(page).to have_content("abcd1234")
    expect(page).to have_content("https://example.com")
    expect(page).to have_content("5")
  end

  scenario "admin denied access with incorrect credentials" do
    # Authorize with incorrect credentials
    auth = ActionController::HttpAuthentication::Basic.encode_credentials('wrong_username', 'wrong_password')
    page.driver.header('Authorization', auth)
    
    # Visit the admin dashboard page
    visit "/admin"

    # Expect the page to display an unauthorized message
    expect(page).to have_content("HTTP Basic: Access denied.")
  end
end
