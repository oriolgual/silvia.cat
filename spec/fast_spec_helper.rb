gem 'minitest'
require 'minitest/spec'
require 'minitest/autorun'

def setup_active_record
  require 'active_record'
  unless ActiveRecord::Base.connected?
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
    silence_stream(STDOUT) do
      require_relative '../db/schema.rb'
    end
  end
end

def require_model(file)
  setup_active_record
  require_relative "../app/models/#{file}"
end

def require_uploader(file)
  require_carrierwave
  require_relative "../app/uploaders/#{file}"
end

def require_service(file)
  require_relative "../app/services/#{file}"
end

def require_carrierwave
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
end

def require_blueprints
  require_relative 'blueprints'
end

def require_foo
  require_relative 'support/foo_model'
end

def rails_root
  File.expand_path(File.dirname(__FILE__))
end
