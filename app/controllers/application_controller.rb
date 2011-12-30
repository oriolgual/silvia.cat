require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery

  private
  def select_layout
    if pjax_request?
      false
    else
      'application'
    end
  end

  def pjax_request?
    request.headers['X-PJAX']
  end
end
