# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
gem 'pg', '~> 0.18.4'

# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
# gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootsnap', '~> 1.4', '>= 1.4.5'
gem 'bootstrap', '~> 4.4', '>= 4.4.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.5'
gem 'popper_js', '~> 1.16'
gem 'rails-i18n', '~> 6.0.0'
gem 'simple_form', '~> 5.0', '>= 5.0.1'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'nokogiri', '~> 1.6', '>= 1.6.8'
  gem 'rspec', '~> 3.5'
  gem 'rspec-rails', '4.0.0.beta3'
  gem 'selenium-webdriver'
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.1'
  gem 'timecop', '~> 0.8.1'
  gem 'travis', '~> 1.8', '>= 1.8.10'
  gem 'travis-lint', '~> 2.0'
  gem 'webdrivers'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
