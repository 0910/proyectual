class AddSubtitleToNews < ActiveRecord::Migration
  def change
  	add_column :news, :subtitle, :string
  end
end
