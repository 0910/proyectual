class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :youtube, :string
    add_column :events, :instagram, :string
    add_column :events, :twitter, :string
  end
end
