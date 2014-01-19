# Thumbnailer adds thumbnailing support. It is meant to be used together
# with JCrop (a jQuery plugin).
#
# The model including Thumbnailer needs to have a 'thumbnail_coordinates' and
# 'image' as attributes. It also depends on CarrierWave to mount the uploader.
#
require 'active_support'
module Thumbnailer
  extend ActiveSupport::Concern

  included do
    # Mount the Carrierwave uploader to the image attribute
    mount_uploader :image, ImageUploader

    # The image is always mandatory
    validates :image, presence: true

    # Only validate thumbnail_coordinates on update since the creation process
    # does not allow to choose the coordinates
    validates :thumbnail_coordinates, presence: true, on: :update, unless: :image_changed?

    # Store the thumbnail coordinates to generate a thumbnail on the fly
    # using javascript.
    #
    # Example:
    #   { x: 0, y: 100, h: 100, w: 100 }
    #
    serialize :thumbnail_coordinates, Hash

    before_update :thumbnail!
  end

  # Sets the thumbnail_attributes
  #
  # @param value If it's a JSON string it will be parsed as a Hash
  def thumbnail_coordinates=(value)
    thumbnail_coordinates_will_change!

    previous_bounds = thumbnail_coordinates['bounds']

    if value.is_a?(String)
      value, bounds = value.split('#')
      value = ActiveSupport::JSON.decode(value)

      value['bounds'] = bounds || previous_bounds
    end

    super(value)
  end

  # Returns whether the image cn be cropped or not
  #
  # @return Boolean
  def can_be_cropped?
    thumbnail_coordinates.present? &&
    thumbnail_coordinates['x'].to_i > 0 &&
    thumbnail_coordinates['y'].to_i > 0 &&
    thumbnail_coordinates['h'].to_i > 0 &&
    thumbnail_coordinates['w'].to_i > 0
  end

  # A helper that returns the thumbnail version url
  #
  def thumb_url
    image.url(:thumbnail)
  end

  def image_url
    image.url
  end

  def fancybox_url
    image.url(:thumbnail)
  end

  def thumbnail!
    return unless thumbnail_coordinates_changed?
    image.recreate_versions!(:thumbnail)
  end
end
