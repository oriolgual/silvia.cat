class CreateIllustrations < ActiveRecord::Migration
  def change
    create_table :illustrations do |t|
      t.string :name
      t.text :description
      t.string :image
      t.text :thumbnail_coordinates

      t.timestamps
    end
  end
end
