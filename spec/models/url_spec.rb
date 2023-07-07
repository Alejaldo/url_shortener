require 'rails_helper'

RSpec.describe Url, type: :model do
  it { should validate_presence_of(:original_url) }
  it { should validate_uniqueness_of(:short_url) }

  describe "original_url format validation" do
    it "is valid when the original_url is a valid URL" do
      url = Url.new(original_url: 'https://example.com', short_url: 'abcd1234')
      expect(url).to be_valid
    end

    it "is not valid when the original_url is not a valid URL" do
      url = Url.new(original_url: 'not_a_url', short_url: 'abcd1234')
      expect(url).not_to be_valid
      expect(url.errors.messages[:original_url]).to include("must be a valid URL")
    end
  end
end
