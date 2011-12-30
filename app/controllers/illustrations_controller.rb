# This controller is used as a REST interface for Illustrations
#
class IllustrationsController < ApplicationController
  inherit_resources
  actions :index, :show
  belongs_to :category, optional: true

  layout :select_layout
  helper_method :elements_per_slice

  def show
    @illustrations = Illustration.all unless pjax_request?
    show!
  end

  private
  def elements_per_slice
    8
  end
end
