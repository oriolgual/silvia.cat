class Backend::IllustrationsController < Backend::ResourceController

  # Overwrite IR create action to redirect to edit after create
  #
  def create
    create! do |success, failure|
      success.html { redirect_to edit_backend_illustration_path(resource) }
    end
  end
end
