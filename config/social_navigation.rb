#encoding: utf-8

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_id = 'social'
    primary.item 'twitter', content_tag(:span, '@silviabrujas'), 'http://twitter.com/silviabrujas', title: '@silviabrujas'
    primary.item 'deviantart', content_tag(:span, 'silviabrujas on deviantART'), 'http://silviabrujas.deviantart.com', title: 'silviabrujas on deviantART'
    primary.item 'email', content_tag(:span, 'silvia at silvia.cat'), 'mailto:silvia@silvia.cat', title: 'silvia at silvia.cat'
  end
end
