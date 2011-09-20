#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

unless Rails.env.production?
  include Rake::DSL
  require 'rake/testtask'

  Rake::TestTask.new do |t|
    t.libs << 'spec'
    t.pattern = 'spec/**/*_spec.rb'
    t.verbose = true
  end
end

Silvia::Application.load_tasks
