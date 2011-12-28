# encoding: utf-8

def rails_root
  File.expand_path(File.dirname(__FILE__))
end

Category.destroy_all
Illustration.destroy_all

["Els tresors d'Asgard", "Encàrrecs", "Fanart", "Galeria de dissenys", "Il·lustracions", "Naturales", "Retrats"].each do |name|
  Category.create!(name: name, active: true)
end

fanart_category = Category.find_by_name('Fanart')
galeria_category = Category.find_by_name('Galeria de dissenys')

fanart = []
fanart << { name:  'Inuyasha',
                   description: 'Llapis i Gouache sobre cartulina.',
                   image:       File.open(rails_root + '/seeds/Inuyasha012.jpg') }
fanart << { name:  'Kagome "Inuyasha"',
                   description: 'Llapis i Gouache sobre cartulina.',
                   image:       File.open(rails_root + '/seeds/Kagome010.jpg') }
fanart << { name:  'Kanna "Inuyasha"',
                   description: 'Llapis i Gouache sobre cartulina.',
                   image:       File.open(rails_root + '/seeds/img007.jpg') }
fanart << { name:  'Katara',
                   description: 'Avatar the last airbender',
                   image:       File.open(rails_root + '/seeds/katarafiresd.jpg') }
fanart << { name:  'Katara',
                   description: 'Avatar the last airbender',
                   image:       File.open(rails_root + '/seeds/katarasd.jpg') }
fanart << { name:  'Dorothy i Espantaocells',
                   description: 'OZ Disseny de personatges',
                   image:       File.open(rails_root + '/seeds/oz-D.E..jpg') }
fanart << { name:  'Dorothy i Espantaocells',
                   description: 'OZ',
                   image:       File.open(rails_root + '/seeds/Dorothy-and-scarecrowP2.jpg') }
fanart << { name:  'Mofly',
                   description: 'Mofly el último Koala',
                   image:       File.open(rails_root + '/seeds/MOFLI.jpg') }
fanart << { name:  'Katara',
                   description: 'Avatar the last airbender (aquarel·la)',
                   image:       File.open(rails_root + '/seeds/water_katara_millor_qualitat_by_silviabrujas.jpg') }

fanart.each do |illustration|
  Illustration.create!(name: illustration[:name],
                      description: illustration[:description],
                      image: illustration[:image],
                      category: fanart_category,
                      thumbnail_coordinates: { x: 100, y: 100, h: 100, w: 100 })
end
