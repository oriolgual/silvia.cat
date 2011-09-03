require 'machinist/active_record'

Illustration.blueprint do
  name { "Illustration #{sn}" }
  image { File.open(Rails.root.join('specs/support/files/illustration.jpg')) }
  thumbnail_coordinates { {x1: 0, y1: 0, x2: 100, y2: 100, width: 100, height: 100} }
  tags { [Tag.make] }
end

Tag.blueprint do
  name { "Tag #{sn}" }
end

Video.blueprint do
  name { "Video #{sn}" }
  url  { "http://www.youtube.com/watch?v=uNjIWiocYpg" }
  tags { [Tag.make] }
end
