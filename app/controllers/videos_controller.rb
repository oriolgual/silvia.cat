class VideosController < ApplicationController
  inherit_resources
  actions :index

  layout :select_layout
end
