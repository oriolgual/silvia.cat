# Categories are used to classify Illustrations and Videos
class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true

  has_many :illustrations
  has_many :videos

  # A simple scope to just return active categories
  #
  def self.active
    where(active: true)
  end
end
