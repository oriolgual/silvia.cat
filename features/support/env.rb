require 'active_record'

require 'simplecov'
SimpleCov.start :rails do
  %w(Services Uploaders).each do |name|
    add_group name, "app/#{name.downcase}"
  end
  add_filter do |source_file|
    source_file.filename =~ %r{vendor/plugins}
  end
end

require 'cucumber/rails'
require 'capybara/rails'
require 'email_spec' # add this line if you use spork
require 'email_spec/cucumber'

Capybara.default_selector = :css

ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :transaction

include Warden::Test::Helpers
After{ Warden.test_reset! }
Devise.setup do |config|
  config.stretches = 1
end

require File.join(Rails.root, 'test', 'blueprints')
