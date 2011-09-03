# A Video is a media type with a linked video to an external service
class Video < ActiveRecord::Base
  validates :name, :url, :tags, presence: true

  has_and_belongs_to_many :tags
end
