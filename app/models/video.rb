# A Video is a media type with a linked video to an external service
class Video < ActiveRecord::Base
  belongs_to :category

  validates :name, :url, :category, presence: true

  translates :name, :description
end
