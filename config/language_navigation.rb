#encoding: utf-8

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_id = 'language'
    primary.item 'ca', 'Català', request.path + '?locale=ca', highlights_on: lambda { I18n.locale.to_s == 'ca' }
    primary.item 'es', 'Español', request.path + '?locale=es', highlights_on: lambda { I18n.locale.to_s == 'es' }
    primary.item 'en', 'English', request.path + '?locale=en', highlights_on: lambda { I18n.locale.to_s == 'en' }
  end
end

