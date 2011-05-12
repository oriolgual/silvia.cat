require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] = "test"
  require File.expand_path('../../config/environment', __FILE__)
  require 'rails/test_help'
  require 'minitest/spec'
  require 'simplecov'
  SimpleCov.start :rails do
    %w(Services Cells Uploaders).each do |name|
      add_group name, "app/#{name.downcase}"
    end
    add_filter do |source_file|
      source_file.filename =~ %r{vendor/plugins}
    end
  end

  class ActiveSupport::TestCase
    # Reset the Machinist cache before each test.
    setup { Machinist.reset_before_test }
  end

  require 'machinist/active_record'
  require 'minitest/autorun'

Spork.each_run do
  Dir[Rails.root.join("test/support/**/*.rb")].each {|f| require f}
  require File.expand_path(File.dirname(__FILE__) + '/blueprints')
end
