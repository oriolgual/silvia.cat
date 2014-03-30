require 'application_responder'
require 'locale_detector'

class ApplicationController < ActionController::Base
  helper_method :illustrations

  self.responder = ApplicationResponder
  respond_to :html
  before_filter :set_locale

  protect_from_forgery

  def illustrations
  end

  private
  def set_locale
    session[:locale] = LocaleDetector.new(params, session, request.env).detect
    I18n.locale = session[:locale]
  end
end
