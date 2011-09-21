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
