class AddAttachmentImageToSplashes < ActiveRecord::Migration
  def self.up
    change_table :splashes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :splashes, :image
  end
end
