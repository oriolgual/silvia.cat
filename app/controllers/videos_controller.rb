class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def category
    @category ||= OpenStruct.new(name: 'Videos')
  end
end
