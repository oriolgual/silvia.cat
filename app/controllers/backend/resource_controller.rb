class Backend::ResourceController < Backend::ApplicationController
  inherit_resources
  self.responder = Backend::Responder

  def collection
    @collection ||= end_of_association_chain.page(params.fetch(:page, 1))
  end
end
