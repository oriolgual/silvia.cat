class TranslateSlugs < ActiveRecord::Migration
  def up
    rename_column :illustrations, :slug, :slug_ca
    add_column :illustrations, :slug_es, :string
    add_index :illustrations, :slug_es

    rename_column :categories, :slug, :slug_ca
    add_column :categories, :slug_es, :string
    add_index :categories, :slug_es

    add_column :videos, :slug_ca, :string
    add_column :videos, :slug_es, :string
    add_index :videos, :slug_ca
    add_index :videos, :slug_es
  end

  def down
    rename_column :illustrations, :slug_ca
    remove_column :illustrations, :slug_es

    rename_column :categories, :slug_ca
    remove_column :categories, :slug_es

    remove_column :videos, :slug_ca
    remove_column :videos, :slug_es
  end
end
