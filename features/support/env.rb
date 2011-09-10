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

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
