class AddFeaturedToIllustrations < ActiveRecord::Migration
  def change
    add_column :illustrations, :featured, :boolean, default: false
  end
end
