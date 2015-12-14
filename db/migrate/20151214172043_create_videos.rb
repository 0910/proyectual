class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :link
      t.references :video_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
