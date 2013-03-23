source 'http://rubygems.org'
ruby '2.0.0'

gem 'rails', '~> 3.2'
gem 'pg'

gem "slim"

group :assets do
  gem 'sass-rails', '~> 3.2'
  gem 'compass', github: 'chriseppstein/compass', branch: 'stable'
  gem 'compass-rails'
  gem "uglifier"
  gem 'masonry-rails'
  gem 'asset_sync'
  gem 'turbo-sprockets-rails3'
end

gem 'inherited_resources'
gem 'responders'
gem "jquery-rails"
gem "formalize-rails"
gem 'fog'
gem 'carrierwave'
gem 'mini_magick'
gem 'has_scope', git: 'git://github.com/plataformatec/has_scope.git'
gem 'jcrop-rails', github: 'nragaz/jcrop-rails', branch: 'master'
gem 'high_voltage'
gem 'foreman'
gem 'unicorn'
gem 'mail_form'
gem 'simple_form'
gem 'twitter_bootstrap_form_for'
gem 'css-bootstrap-rails'
gem 'fancybox-rails'
gem 'friendly_id'
gem 'simple-navigation'
gem 'globalize3'
gem 'kaminari'

group :development do
  gem 'rack-webconsole'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
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
  gem 'sqlite3'
  gem 'pry'
end

group :production do
  gem 'dalli'
  gem 'memcachier'
  gem 'newrelic_rpm'
end
