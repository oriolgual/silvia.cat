# This controller is used as a REST interface for Illustrations
#
class IllustrationsController < ApplicationController
  helper_method :illustrations

  def index
  end

  def show
    @highlighted_illustration = Illustration.find_by_slug(params[:slug])
    redirect_to root_path unless @highlighted_illustration

    @category = @highlighted_illustration.category

    render action: 'index'
  end

  private
  def category
    return nil unless params[:category_id].present?

    @category ||= Category.find_by_slug(params[:category_id])
  end

  def illustrations
    @illustrations ||= if category
                         Illustration.by_category(category)
                       else
                         Illustration.featured
                       end
  end
end
