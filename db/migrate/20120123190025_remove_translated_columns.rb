class RemoveTranslatedColumns < ActiveRecord::Migration
  def up
    remove_column :categories, :name
    remove_column :illustrations, :name
    remove_column :illustrations, :description
    remove_column :videos, :name
    remove_column :videos, :description
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
