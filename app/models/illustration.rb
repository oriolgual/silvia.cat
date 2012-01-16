# An Illustration is a media type with a picture attached
#
class Illustration < ActiveRecord::Base
  include Thumbnailer
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope order('created_at')

  validates :name, :category, presence: true

  delegate :name, to: :category, prefix: true, allow_nil: true

  # A category is needed in order to classify the illustration
  belongs_to :category

  # A scope to get illustration that belong to a category
  #
  # category - The Category that illustration shoudl belong to
  #
  # Returns a collection of illustrations
  def self.by_category(category)
    where(category_id: category)
  end
end
