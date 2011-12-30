#encoding: utf-8

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_id = 'sidebar_navigation'
    primary.item 'about', 'qui sóc?', page_path('about')
    primary.item 'contact', 'contacte', new_contact_path
    primary.item 'phone', '668 860 931'
  end
end
