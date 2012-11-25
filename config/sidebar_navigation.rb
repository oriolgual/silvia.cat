#encoding: utf-8

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_id = 'sidebar_navigation'
    primary.item 'about', I18n.t('navigation.sidebar.about'), page_path('about')
    primary.item 'contact', I18n.t('navigation.sidebar.contact'), new_contact_path
  end
end
