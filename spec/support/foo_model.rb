setup_active_record

class CreateFoos < ActiveRecord::Migration
  def self.up
    create_table :foos do |t|
      t.string :thumbnail_coordinates
      t.string :image
    end
  end
end

CreateFoos.up unless ActiveRecord::Base.connection.table_exists?('foos')

class Foo < ActiveRecord::Base
  include Thumbnailer
end

require 'machinist/active_record'

Foo.blueprint do
  image { File.open(rails_root + '/support/files/illustration.jpg') }
  thumbnail_coordinates { {x1: 0, y1: 0, x2: 100, y2: 100, width: 100, height: 100} }
end
