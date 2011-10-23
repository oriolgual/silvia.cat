# An Illustration is a media type with a picture attached
#
class Illustration < ActiveRecord::Base
  include Thumbnailer

  validates :name, :category, presence: true

  # A category is needed in order to classify the illustration
  belongs_to :category

  def self.by_category(category)
    where(category_id: category)
  end
end
