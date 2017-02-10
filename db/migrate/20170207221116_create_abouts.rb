class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :short_about
      t.text :long_about

      t.timestamps null: false
    end
  end
end
