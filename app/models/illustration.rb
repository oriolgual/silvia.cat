# An Illustration is a media type with a picture attached
class Illustration < ActiveRecord::Base
  include Thumbnailer
  include GlobalizeExtensions
  extend FriendlyId

  friendly_id :name, use: :simple_i18n

  default_scope order('created_at desc')

  validates :name, :category, presence: true

  delegate :name, to: :category, prefix: true, allow_nil: true

  # A category is needed in order to classify the illustration
  belongs_to :category

  translates :name, :description
  translate_accessors_in :ca, :es, :en
  before_save :set_friendly_id

  def self.featured
    where(featured: true)
  end

  # A scope to get illustration that belong to a category
  #
  # category - The Category that illustration shoudl belong to
  #
  # Returns a collection of illustrations
  def self.by_category(category)
    where(category_id: category)
  end

  def self.find_by_slug(slug)
    where('slug_ca = ? OR slug_es = ? OR slug_en = ?', slug, slug, slug).first
  end

  # Never generate automatically a new slug because it has problems with
  # multiple locales.
  def should_generate_new_friendly_id?
    false
  end

  # Set the slug in all available locales
  def set_friendly_id(*args)
    I18n.available_locales.each do |locale|
      I18n.with_locale(locale) do
        super(name, locale)
      end
    end
  end
end
