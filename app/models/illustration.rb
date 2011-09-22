# An Illustration is a media type with a picture attached
#
class Illustration < ActiveRecord::Base
  include Thumbnailer

  validates :name, :tags, presence: true

  # Tags are needed in order to classify the illustration
  has_and_belongs_to_many :tags
end
