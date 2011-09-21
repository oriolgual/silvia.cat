if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    %w(Models Helpers Services Cells Observers Uploaders).each do |name|
      add_group name, "app/#{name.downcase}"
    end
    add_filter '/test/'
    add_filter '/features/'
    add_filter '/config/'
    add_filter '/db/'
    add_filter '/vendor/'
    add_filter '/lib/'

    # Tested at an integration level
    add_filter '/app\/controllers/'
    add_filter '/app\/mailers/'
  end
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'
require 'mocha'
require 'machinist/active_record'
require 'database_cleaner'
DatabaseCleaner.strategy = :transaction

ActiveRecord::Base.observers = []

class MiniTest::Unit::TestCase
  include Mocha::API
  def setup
    Machinist.reset_before_test
    DatabaseCleaner.start
    mocha_setup
  end
  def teardown
    DatabaseCleaner.clean
    mocha_teardown
  end
end

require File.expand_path(File.dirname(__FILE__) + '/blueprints')
Dir[Rails.root.join("specs/support/**/*.rb")].each {|f| require f}
require 'minitest/autorun'
