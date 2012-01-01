class Backend::ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with name: ENV['backend_user'], password: ENV['backend_password']
end
