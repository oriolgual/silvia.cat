source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'

gem "devise"
gem "slim"
gem "slim-rails"
gem 'compass', git: 'https://github.com/chriseppstein/compass.git', branch: 'rails31'

# Asset template engines
gem 'sass-rails'
gem 'coffee-script'
gem 'barista'

gem 'simple_form'
gem "simple-navigation"
gem 'inherited_resources'
gem 'flash_messages_helper'
gem 'responders'
gem 'button_form'
gem "jquery-rails"
gem 'carrierwave'
gem 'client_side_validations'
gem 'high_voltage'

group :development do
  gem 'foreman'
end

group :test do
  gem 'rack-test', git: 'git://github.com/oriolgual/rack-test.git'
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'rspec-core', '~> 2.6.3.beta1'
  gem 'email_spec', require: false
  gem 'minitest'
  gem 'mocha'
  gem 'simplecov', require: false
  gem 'database_cleaner'
  gem 'turn', require: false, git: 'git://github.com/TwP/turn.git'
  gem 'machinist', '>= 2.0.0.beta1'
  gem 'launchy'
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-minitest', git: 'git://github.com/oriolgual/guard-minitest.git', branch: 'add_support_for_drb'
  gem 'guard-annotate'
end

group :development, :test do
  gem 'sqlite3'
end
