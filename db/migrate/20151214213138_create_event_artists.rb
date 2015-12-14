class CreateEventArtists < ActiveRecord::Migration
  def change
    create_table :event_artists do |t|
      t.references :event, index: true, foreign_key: true
      t.references :artist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
