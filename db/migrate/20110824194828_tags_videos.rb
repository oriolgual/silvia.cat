class TagsVideos < ActiveRecord::Migration
  def change
    create_table :tags_videos, id: false do |t|
      t.references :tag
      t.references :video
    end

    add_index :tags_videos, :tag_id
    add_index :tags_videos, :video_id
  end
end
