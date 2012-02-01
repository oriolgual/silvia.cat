class CopyCatalanSlugsToSpanish < ActiveRecord::Migration
  def up
    Illustration.find_each do |record|
      record.update_attribute(:slug_es, record.slug_ca)
    end

    Category.find_each do |record|
      record.update_attribute(:slug_es, record.slug_ca)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
