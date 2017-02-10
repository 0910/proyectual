class RemoveColumnsFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :website
  end
end
