source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'pg' #needed for Heroku deployment, this requires $ sudo apt-get install libpq-dev
gem 'awesome_print'
gem 'newrelic_rpm'
gem 'haml-rails'
gem 'html5-rails'
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'
gem 'country_select'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-identity'
gem 'forgery' # Move to dev when done testing on Heroku

group :test, :development do
  gem 'turn', '< 0.8.3'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'guard-rspec'
  gem 'mongrel', '1.2.0.pre2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'compass_twitter_bootstrap'
  gem 'compass-susy-plugin', :require => 'susy'
  gem 'compass-h5bp'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
