# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Caching
gem 'redis'
# Use SCSS for stylesheets
gem 'sassc'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

gem 'dotenv-rails', groups: [:development, :test]

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'web-console', '>= 3.3.0'
  # For debugs: binding.pry
  gem 'pry'
  # To keep code style standartized
  gem 'rubocop', '~> 0.73.0', require: false
  # Spring speeds up development by keeping your application running in the background
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # IntelliSense, auto-complection and a lot of more useful stuff for code writing
  gem 'solargraph'
end

group :test do
  # Adds support for Capybara system testing and web drivers
  gem 'capybara', '>= 2.15'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
