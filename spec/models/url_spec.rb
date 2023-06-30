require 'rails_helper'

RSpec.describe Url, type: :model do
  it "is valid with valid attributes" do
    url = Url.new(original_url: "https://example.com", short_url: "abc123")
    expect(url).to be_valid
  end
end
