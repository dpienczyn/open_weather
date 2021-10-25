source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'faraday', '~> 0.9.2'
gem 'ostruct', '~> 0.1.0'
gem 'json'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'devise'
gem 'omniauth-rails_csrf_protection'
gem 'rack-cors'
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'faker', '~> 2.19'
  gem 'factory_bot_rails', '~> 4.11.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'simplecov', '~> 0.19.0', require: false
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
