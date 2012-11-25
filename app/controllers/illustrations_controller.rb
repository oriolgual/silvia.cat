# This controller is used as a REST interface for Illustrations
#
class IllustrationsController < ApplicationController
  inherit_resources
  actions :index, :show
  belongs_to :category, optional: true

  layout :select_layout
  helper_method :elements_per_slice

  def index
    @illustrations = Illustration.featured unless params[:category_id]
    index!
  end
end
