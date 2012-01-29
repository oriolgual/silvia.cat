module GlobalizeExtensions
  extend ActiveSupport::Concern

  included do
    def self.translate_accessors_in(*locales)
      locales.each do |locale|
        translated_attribute_names.each do |field|
          define_method("#{field}_#{locale}") do
            ::Globalize.with_locale(locale) do
              self.send("#{field}")
            end
          end

          define_method("#{field}_#{locale}=") do |value|
            ::Globalize.with_locale(locale) do
              self.send("#{field}=", value)
            end
          end
        end
      end
    end
  end
end
