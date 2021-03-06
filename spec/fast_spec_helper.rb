gem 'minitest'
require 'minitest/spec'
require 'minitest/autorun'

def setup_active_record
  require 'active_record'
  unless ActiveRecord::Base.connected?
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/test.sqlite')
  end
  setup_database_cleaner
end

def setup_database_cleaner
  require 'database_cleaner'
  require_relative 'database_cleaner_helper'
end

def require_model(file)
  setup_active_record
  require_relative "../app/models/#{file}"
  require_blueprint(file)
end

def require_uploader(file)
  require_carrierwave
  require_relative "../app/uploaders/#{file}"
end

def require_service(file)
  require_relative "../app/services/#{file}"
end

def require_lib(file)
  require_relative "../lib/#{file}"
end

def require_concern(file)
  require_relative "../app/models/concerns/#{file}"
end

def require_carrierwave
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
end

def require_blueprint(file)
  require_relative "blueprints/#{file}"
end

def require_foo
  require_relative 'support/foo_model'
end

def rails_root
  File.expand_path(File.dirname(__FILE__))
end
