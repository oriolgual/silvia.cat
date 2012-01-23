# Categories are used to classify Illustrations and Videos
class Category < ActiveRecord::Base
  extend FriendlyId
  include GlobalizeExtensions

  friendly_id :name, use: :simple_i18n
  validates :name, presence: true

  has_many :illustrations, dependent: :nullify
  has_many :videos, dependent: :nullify

  translates :name
  translate_accessors_in :ca, :es

  # A simple scope to just return active categories
  #
  def self.active
    where(active: true)
  end
end
