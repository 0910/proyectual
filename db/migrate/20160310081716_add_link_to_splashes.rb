class AddLinkToSplashes < ActiveRecord::Migration
  def change
    add_column :splashes, :link, :string
  end
end
