# An Illustration is a media type with a picture attached
#
class Illustration < ActiveRecord::Base
  validates :name, :image, presence: true
  validates :thumbnail_coordinates, presence: true, on: :update

  has_and_belongs_to_many :tags

  mount_uploader :image, ImageUploader

  serialize :thumbnail_coordinates, Hash
end
