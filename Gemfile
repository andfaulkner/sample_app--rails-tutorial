source 'https://rubygems.org'

gem 'rails',  '3.2.12'
gem "thin"
# gem "passenger", ">= 5.0.27", require: "phusion_passenger/rack_handler"
# gem "puma", ">= 3.4.0"

# To use ActiveModel has_secure_password
gem 'bcrypt', '3.1.7'
gem 'bcrypt-ruby', '~>3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'oauth2'
gem 'rabl'
gem 'cancan'
# gem 'doorkeeper'  # <<< seems to require higher ruby version
# gem 'devise'
gem 'delayed_job'
gem 'squeel'
gem 'skylight'
gem 'grape'
gem 'roo'
gem 'draper'
gem 'ice_cube'
# gem 'unirest'
gem 'bootstrap-sass', '3.2.0.0'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
	gem 'jquery-rails'
	gem 'turbolinks'
	gem 'jbuilder'
	gem 'sdoc'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails', '~> 3.0'
  gem 'sqlite3'
  gem 'spring'
  gem 'meta_request'
  gem 'debugger'
  gem 'listen', '~> 3.0.6'
  gem 'guard'
  gem 'guard-rspec'
  gem 'pry'
  gem 'pry-debugger'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
end

group :test do
  gem "minitest", "~> 4.0"
  # gem 'minitest-rails'
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard-minitest'
  gem 'factory_girl'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'