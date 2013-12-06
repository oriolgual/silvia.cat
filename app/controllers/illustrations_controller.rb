# This controller is used as a REST interface for Illustrations
#
class IllustrationsController < ApplicationController
  layout :select_layout

  def index
    @illustrations = if category
                       Illustration.by_category(category)
                     else
                       Illustration.featured
                     end
  end

  private
  def category
    return nil unless params[:category_id].present?

    @category ||= Category.find_by_slug(params[:category_id])
  end
end
