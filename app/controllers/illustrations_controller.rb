# This controller is used as a REST interface for Illustrations
#
class IllustrationsController < ApplicationController
  inherit_resources
  actions :index, :show
  belongs_to :category, optional: true
  layout :select_layout
  helper_method :elements_per_slice

  def show
    unless pjax_request?
      @illustrations = Illustration.all
    end
    show!
  end

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

  def elements_per_slice
    8
  end
end
