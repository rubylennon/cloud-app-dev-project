source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record [https://rubygems.org/gems/sqlite3]
gem "sqlite3", "~> 1.4"

# use devise for flexible user authentication [https://rubygems.org/gems/devise]
gem 'devise', '~> 4.8', '>= 4.8.1'

# use jquery-rails to provide jQuery and the jQuery-ujs driver [https://rubygems.org/gems/jquery-rails]
gem 'jquery-rails', '~> 4.5'

# use devise-bootstrapped generate default views styled with Bootstrap
gem 'devise-bootstrapped', '~> 0.1.1'

# library for retrieving and parsing feeds
gem 'feedjira'

# add comment here
gem 'httparty', '~> 0.20.0'

# Ruby FFI library
gem 'ffi', '~> 1.15', '>= 1.15.5'

# Ruby 2 debugger
gem 'byebug', '~> 9.0', '>= 9.0.6'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# activity tracking for your ActiveRecord models
gem 'public_activity', git: 'https://github.com/chaps-io/public_activity', tag: 'v2.0.2'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Simple authorization solution for Rails. All permissions are stored in a single location.
gem 'cancancan', '~> 3.4'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# adds an object-oriented layer of presentation logic to your Rails apps
gem 'draper', '~> 4.0', '>= 4.0.2'

# Rails observer
gem 'rails-observers', '~> 0.1.5'

# Provides a simple logging utility for outputting messages
gem 'logger', '~> 1.5', '>= 1.5.2'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
