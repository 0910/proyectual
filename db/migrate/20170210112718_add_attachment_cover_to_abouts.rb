class AddAttachmentCoverToAbouts < ActiveRecord::Migration
  def self.up
    change_table :abouts do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :abouts, :cover
  end
end
