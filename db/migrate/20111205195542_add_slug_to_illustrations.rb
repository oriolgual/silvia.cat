class AddSlugToIllustrations < ActiveRecord::Migration
  def change
    add_column :illustrations, :slug, :string
    add_index :illustrations, :slug, unique: true
  end
end
