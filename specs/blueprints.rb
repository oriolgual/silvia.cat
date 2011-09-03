require 'machinist/active_record'

Illustration.blueprint do
  name { "Illustration #{sn}" }
  file { File.open(Rails.root.join('test/support/files/illustration.jpg')) }
  thumbnail_coordinates { {x1: 0, y1: 0, x2: 100, y2: 100, width: 100, height: 100} }
end