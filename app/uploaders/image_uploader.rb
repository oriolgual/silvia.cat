# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Main version, restrict the height to 480px
  #
  version :main do
    process resize_to_limit: [330, '']
  end

  # Thumbnail version. Crop the image with the model coordinates and then
  # resize it to 100x100
  #
  version :thumbnail do
    process :crop
    process resize_to_limit:  [330, '']
  end

  # Tell ImageMagick to crop the image with the model coordinates
  #
  def crop
    return unless model.can_be_cropped?
    manipulate! do |image|
      crop_ratio = ratio(image[:width], model.thumbnail_coordinates.fetch('bounds'))
      coordinates = magick_thumbnail_coordinates(model.thumbnail_coordinates, crop_ratio)

      image.combine_options do |command|
        command.crop(coordinates)
      end
      image
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def ratio(original_width, bounds)
    width, height = bounds.split(',')

    original_width / width.to_f
  end

  # A helper to return the thumbnail_coordinates in a friendly format for
  # ImageMagick.
  def magick_thumbnail_coordinates(coordinates, ratio = 1)
    ratio = 1 if ratio.to_i == 0

    x = coordinates['x'].to_i * ratio
    y = coordinates['y'].to_i * ratio
    height = coordinates['h'].to_i * ratio
    width = coordinates['w'].to_i * ratio
    "#{width}x#{height}+#{x}+#{y}"
  end

end
