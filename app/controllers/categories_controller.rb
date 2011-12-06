# This controller is used as a REST interface for Categoris
#
class CategoriesController < ApplicationController
  inherit_resources
  actions :show

  def show
    page = params[:page] || 1
    @illustrations = Illustration.by_category(resource).page(page)
    show!
  end
end
