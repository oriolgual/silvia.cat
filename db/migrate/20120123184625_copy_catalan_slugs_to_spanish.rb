class CopyCatalanSlugsToSpanish < ActiveRecord::Migration
  def up
    Illustration.find_each do |record|
      record.set_friendly_id(record.slug_ca, :es)
    end

    Category.find_each do |record|
      record.set_friendly_id(record.slug_ca, :es)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
