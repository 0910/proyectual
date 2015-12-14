class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :video
      t.string :website
      t.string :facebook
      t.string :resident_advisor
      t.text :description

      t.timestamps null: false
    end
  end
end
