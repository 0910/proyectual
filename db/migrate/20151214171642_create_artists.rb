class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :website
      t.string :resident_advisor
      t.string :facebook
      t.string :soundcloud

      t.timestamps null: false
    end
  end
end
