# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  # Main version, restrict the height to 480px
  #
  version :main do
    process resize_to_limit: ['', 480]
  end

  # Thumbnail version. Crop the image with the model coordinates and then
  # resize it to 100x100
  #
  version :thumbnail do
    process :crop
    process resize_to_fill:  [95, 95]
  end

  # Tell ImageMagick to crop the image with the model coordinates
  #
  def crop
    return unless model.can_be_cropped?
    manipulate! do |image|
      image.combine_options do |command|
        command.crop(model.magick_thumbnail_coordinates)
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
end
