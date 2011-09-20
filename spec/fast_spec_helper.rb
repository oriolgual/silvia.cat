require 'bundler/setup'
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

def require_model(model)
  setup_active_record
  require_relative "../app/models/#{model}"
end

def require_uploader(uploader)
  require_carrierwave
  require_relative "../app/uploaders/#{uploader}"
end

def require_carrierwave
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
end

def require_blueprints
  require_relative "blueprints"
end
