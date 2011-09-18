# An Illustration is a media type with a picture attached
#
class Illustration < ActiveRecord::Base
  validates :name, :image, :tags, presence: true

  # Only validate thumbnail_coordinates on update since the creation process
  # does not allow to choose the coordinates
  validates :thumbnail_coordinates, presence: true, on: :update, unless: :image_changed?

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

  # Sets the thumbnail_attributes
  #
  # @param value If it's a JSON string it will be parsed as a Hash
  def thumbnail_coordinates=(value)
    if value.is_a?(String)
      value = ActiveSupport::JSON.decode(value)
    end
    self[:thumbnail_coordinates] = value
  end

  def can_be_cropped?
    thumbnail_coordinates.present? &&
    thumbnail_coordinates['x'].to_i > 0 &&
    thumbnail_coordinates['y'].to_i > 0 &&
    thumbnail_coordinates['h'].to_i > 0 &&
    thumbnail_coordinates['w'].to_i > 0
  end

  after_update :thumbnail!

  def thumbnail!
    image.recreate_versions! if thumbnail_coordinates_changed?
  end
end
