# Categories are used to classify Illustrations and Videos
class Category < ActiveRecord::Base
  extend FriendlyId
  include GlobalizeExtensions

  friendly_id :name, use: :simple_i18n
  validates :name, presence: true

  has_many :illustrations, dependent: :nullify

  translates :name
  translate_accessors_in :ca, :es, :en
  before_save :set_friendly_id

  # A simple scope to just return active categories
  #
  def self.active
    where(active: true)
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
