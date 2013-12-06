source 'http://rubygems.org'
ruby '2.0.0'

gem 'rails', '~> 3.2'
gem 'pg'

# Backend
gem 'jcrop-rails', github: 'nragaz/jcrop-rails', branch: 'master'
gem 'kaminari'
gem 'responders'

# Images
gem 'fog'
gem 'carrierwave'
gem 'mini_magick'

# App
gem 'inherited_resources'
gem 'high_voltage'
gem 'friendly_id'
gem 'globalize3'
gem 'mail_form'
gem 'simple_form'
gem 'simple-navigation'
gem "slim"
gem 'cache_digests'

# Server
gem 'foreman'
gem 'unicorn'

group :assets do
  gem 'sass-rails', '~> 3.2'
  gem 'compass', github: 'chriseppstein/compass', branch: 'stable'
  gem 'compass-rails'
  gem "jquery-rails"
  gem 'fancybox-rails'
  gem 'masonry-rails'
  gem "uglifier"
  gem 'asset_sync'
  gem 'turbo-sprockets-rails3'
end

group :development do
  gem 'rack-webconsole'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'minitest'
  gem 'mocha'
  gem 'simplecov', require: false
  gem 'database_cleaner'
  gem 'machinist'
  gem 'launchy'
  gem 'growl'
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-minitest'
  gem 'guard-shell'
end

group :development, :test do
  gem 'pry'
end

group :production do
  gem 'dalli'
  gem 'memcachier'
  gem 'newrelic_rpm'
end
