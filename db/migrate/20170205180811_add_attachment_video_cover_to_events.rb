class AddAttachmentVideoCoverToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :video_cover
    end
  end

  def self.down
    remove_attachment :events, :video_cover
  end
end
