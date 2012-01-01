# encoding: utf-8

def rails_root
  File.expand_path(File.dirname(File.dirname(__FILE__)))
end

def seeds_path
  rails_root + "/db/seeds/"
end

categories = Dir.glob(seeds_path + '*').map {|path| Category.create!(name: path.split('/').last, active: true)}

categories.each do |category|
  Dir.glob(seeds_path + category.name + '/*.jpg').each do |image|
    name = image.split('/').last.split('.').first
    Illustration.create!(name: name,
                        description: name,
                        image: File.open(image),
                        category: category,
                        thumbnail_coordinates: { x: 100, y: 100, h: 100, w: 100 })
  end
end
