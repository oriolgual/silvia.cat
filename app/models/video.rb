# A Video is a media type with a linked video to an external service
class Video < ActiveRecord::Base
  validates :name, :url, :category, presence: true

  belongs_to :category
end
