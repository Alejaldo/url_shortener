require 'rails_helper'
require 'uri'

RSpec.feature "UrlViews", type: :feature do
  scenario "user shortens a URL" do
    # Visit the root path (UrlViewsController index action)
    visit root_path

    # Fill in the form with an original URL
    fill_in "original_url", with: "https://example.com"

    # Click the "Shorten" button
    click_button I18n.t('url_shortener.form.button')

    # Expect the page to display the shortened URL
    expect(page).to have_content(I18n.t('url_shortener.flash.shortened'))
  end

  scenario "user visits a shortened URL" do
    # Create a Url record
    url = Url.create(original_url: 'https://example.com', short_url: 'abcd1234', click_count: 0)

    # Visit the shortened URL path (UrlsController show action)
    visit "/#{url.short_url}"

    # Normalize both the expected and actual URLs before comparing
    expected_url = URI.parse(url.original_url).normalize.to_s
    actual_url = URI.parse(page.current_url).normalize.to_s

    # Expect the browser to be redirected to the original URL
    expect(actual_url).to eq(expected_url)
  end

  scenario "user tries to shorten an invalid URL" do
    # Visit the root path (UrlViewsController index action)
    visit root_path

    # Fill in the form with an invalid URL
    fill_in "original_url", with: "not_a_valid_url"

    # Click the "Shorten" button
    click_button "Shorten"

    # Expect the page to display an error message
    expect(page).to have_content("must be a valid URL")
  end
end
