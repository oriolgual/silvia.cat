# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  # storage :fog
  process :resize_to_limit => [480, 'X']

  version :thumbnail do
    process :crop
    process resize_to_fill:  [100, 100]
  end

  def crop
    return unless model.can_be_cropped?
    manipulate! do |image|
      x = model.thumbnail_coordinates['x'].to_i
      y = model.thumbnail_coordinates['y'].to_i
      height = model.thumbnail_coordinates['h'].to_i
      width = model.thumbnail_coordinates['w'].to_i

      image.combine_options do |cmd|
        cmd.crop("#{width}x#{height}+#{x}+#{y}")
      end
      image
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
