# This controller is used as a REST interface for Illustrations
#
class IllustrationsController < ApplicationController
  inherit_resources
  actions :index, :show
  belongs_to :category, optional: true
  layout :select_layout

  private
  def select_layout
    if request.headers['X-PJAX']
      false
    else
      'application'
    end
  end
end
