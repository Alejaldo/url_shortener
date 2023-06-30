source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.5"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", require: false
gem 'dotenv-rails', '~> 2.8'

group :development, :test do
  gem 'byebug', "~> 11.1"
  gem 'rspec-rails', '~> 6.0'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails', "~> 6.2"
  gem 'shoulda-matchers', "~> 5.3"
end

group :development do
  gem "web-console"
end
