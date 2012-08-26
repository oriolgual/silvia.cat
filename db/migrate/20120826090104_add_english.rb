class AddEnglish < ActiveRecord::Migration
  def up
    add_column :illustrations, :slug_en, :string
    add_index :illustrations, :slug_en

    add_column :categories, :slug_en, :string
    add_index :categories, :slug_en

    add_column :videos, :slug_en, :string
    add_index :videos, :slug_en

    Illustration.find_each do |record|
      record.update_attribute(:slug_en, record.slug_ca)
    end

    Category.find_each do |record|
      record.update_attribute(:slug_en, record.slug_ca)
    end

    Video.find_each do |record|
      record.update_attribute(:slug_en, record.slug_ca)
    end
  end

  def down
    remove_column :illustrations, :slug_en

    remove_column :categories, :slug_en

    remove_column :videos, :slug_en
  end
end
