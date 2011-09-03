# An Illustration is a media type with a picture attached
#
class Illustration < ActiveRecord::Base
  validates :name, :image, :tags, presence: true

  # Only validate thumbnail_coordinates on update since the creation process
  # does not allow to choose the coordinates
  validates :thumbnail_coordinates, presence: true, on: :update

  # Tags are needed in order to classify the illustration
  has_and_belongs_to_many :tags

  # Mount the Carrierwave uploader to the image attribute
  mount_uploader :image, ImageUploader

  # Store the thumbnail coordinates to generate a thumbnail on the fly
  # using javascript.
  #
  # Example:
  #   { x1: 0, y1: 0, x2: 100, y2: 100, width: 100, height: 100 }
  #
  serialize :thumbnail_coordinates, Hash
end
