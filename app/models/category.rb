# Categories are used to classify Illustrations and Videos
class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :illustrations
  has_many :videos
end
