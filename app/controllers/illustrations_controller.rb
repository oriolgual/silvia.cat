# This controller is used as a REST interface for Illustrations
#
class IllustrationsController < ApplicationController
  inherit_resources
  actions :index, :show
  has_scope :page, default: 1
end
