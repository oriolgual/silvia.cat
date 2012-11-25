SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_id = 'work_categories'
    Category.active.each do |category|
      primary.item category.to_param, category.name, url_for(controller: '/illustrations', action: 'index', category_id: category), highlights_on: :subpath
    end
    primary.item 'videos', 'Videos', videos_path, highlights_on: :subpath
  end
end
