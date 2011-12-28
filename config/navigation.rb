SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    Category.active.each do |category|
      primary.item category.to_param, category.name, url_for(controller: '/illustrations', action: 'index', category_id: category), highlights_on: :subpath
    end
  end
end
