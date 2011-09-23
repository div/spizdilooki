source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'

gem 'resque', :require => 'resque/server'
gem 'nokogiri'
gem 'carrierwave'
gem 'heroku'
gem 'thin'
gem 'rmagick'
gem 'fog'
gem 'bootstrap-sass', '1.3.0'
gem 'kaminari'
gem 'clockwork'

group :development, :test do
  gem 'sqlite3'
  gem 'foreman'
end

group :production do
  gem 'pg' 
end

gem 'resque-heroku-autoscaler', :git => 'git://github.com/div/resque-heroku-autoscaler.git', :branch => 'cedar'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
