if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start :rails do
    %w(Services Uploaders).each do |name|
      add_group name, "app/#{name.downcase}"
    end
    add_filter do |source_file|
      source_file.filename =~ %r{vendor/plugins}
    end
  end
end

require 'cucumber/rails'
require 'capybara/rails'
require Rails.root.join('spec/blueprints')

ActionController::Base.allow_rescue = false

if(ENV['FAILFAST'])
  After do |s|
    Cucumber.wants_to_quit = true if s.failed?
  end
end

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
