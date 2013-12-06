class Backend::ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with name: ENV.fetch('backend_user', 'foo'), password: ENV.fetch('backend_password', 'bar')
end
