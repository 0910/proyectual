class CreateAboutsTranslations < ActiveRecord::Migration
  def self.up
    About.create_translation_table!({
      :short_about => :text,
      :long_about => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    About.drop_translation_table! :migrate_data => true
  end
end
