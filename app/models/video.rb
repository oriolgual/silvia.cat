# A Video is a media type with a linked video to an external service
class Video < ActiveRecord::Base
  include GlobalizeExtensions

  validates :name, :url,  presence: true

  translates :name, :description
  translate_accessors_in :ca, :es
end
