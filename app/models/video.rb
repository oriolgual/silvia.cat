# A Video is a media type with a linked video to an external service
class Video < ActiveRecord::Base
  include GlobalizeExtensions
  belongs_to :category

  validates :name, :url, :category, presence: true

  translates :name, :description
  translate_accessors_in :ca, :es
end
