require 'i18n'

# Public: Detect the locale from the current user using different strategies.
#
# Examples:
#
#
#   class ApplicationController < ActionController::Base
#     before_filter :set_locale
#
#     def set_locale
#       session[:locale] = LocaleDetector.new(params, session, request.env).detect
#       I18n.locale = session[:locale]
#     end
#   end
#
class LocaleDetector

  # Public: Initialize a LocaleDetector
  #
  # params - A Hash with a String key named locale
  # session - A Hash with a Symbol key named :locale
  # request - A Hash with a String key named HTTP_ACCEPT_LANGUAGE
  def initialize(params, session, request)
    @params, @session, @request = params, session, request
  end

  # Public: Detect the locale.
  # It will try to detect it first from the params, then try the session, then
  # from the request. If all fails fallback to I18n default locale
  #
  # Returns a Symbol representing the locale
  def detect
    detect_from_params || detect_from_session || detect_from_request || I18n.default_locale
  end

  # Private: Detect the locale from the params
  #
  # Returns a Symbol representing the locale or nil if none was found
  def detect_from_params
    @params['locale'].to_sym if available?(@params['locale'])
  end

  # Private: Detect the locale from the session
  #
  # Returns a Symbol representing the locale or nil if none was found
  def detect_from_session
    @session[:locale].to_sym if available?(@session[:locale])
  end

  # Private: Detect the locale from the HTTP request.
  # It will try to find an available locale from all the accepted by the user.
  #
  # Returns a Symbol representing the locale or nil if none was found
  def detect_from_request
    locales = @request['HTTP_ACCEPT_LANGUAGE'].to_s.scan(/[a-z]{2}/).uniq
    locale = locales.detect { |locale| available?(locale) }
    locale.to_sym if locale
  end

  private
  def available?(locale)
    I18n.available_locales.include?(locale.to_sym) if locale
  end
end
