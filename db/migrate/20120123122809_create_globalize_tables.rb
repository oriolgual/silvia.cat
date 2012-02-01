class Category < ActiveRecord::Base
  include GlobalizeExtensions
  translates :name
end
class Illustration < ActiveRecord::Base
  include GlobalizeExtensions
  translates :name, :description
end
class Video < ActiveRecord::Base
  include GlobalizeExtensions
  translates :name, :description
end
class CreateGlobalizeTables < ActiveRecord::Migration
  def up
    Category.create_translation_table!({
      name: :string,
    }, {
      migrate_data: true
    })

    Illustration.create_translation_table!({
      name: :string,
      description:  :text
    }, {
      migrate_data: true
    })

    Video.create_translation_table!({
      name: :string,
      description:  :text
    }, {
      migrate_data: true
    })
  end

  def down
    Category.drop_translation_table!
    Illustration.drop_translation_table!
    Video.drop_translation_table!
  end
end
