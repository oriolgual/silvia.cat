class IllustrationsTags < ActiveRecord::Migration
  def change
    create_table :illustrations_tags, id: false do |t|
      t.references :illustration
      t.references :tag
    end

    add_index :illustrations_tags, :illustration_id
    add_index :illustrations_tags, :tag_id
  end
end
