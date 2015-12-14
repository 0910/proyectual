class AddSlugToTables < ActiveRecord::Migration
  def change
  	add_column :artists, :slug, :string
  	add_column :events, :slug, :string
  	add_column :news, :slug, :string
  	add_column :videos, :slug, :string
  end
end
