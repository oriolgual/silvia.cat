#encoding: utf-8

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_id = 'language'
    primary.item 'ca', 'Català', request.path + '?locale=ca'
    primary.item 'es', 'Español', request.path + '?locale=es'
  end
end

