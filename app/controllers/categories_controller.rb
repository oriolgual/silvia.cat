# This controller is used as a REST interface for Categoris
#
class CategoriesController < ApplicationController
  inherit_resources
  actions :show

  def show
    @illustrations = Illustration.by_category(resource)
    show!
  end
end
