class Image < ActiveRecord::Base
  has_attached_file :file, :styles => {:thumb => '210x126>', :small => '420x252>', :medium => '840x504>', :large => '1440x864>'}, default_url: "/images/:style/missing.png"
  validates_attachment :file, presence: true, content_type: { content_type: ['image/jpg', 'image/png', 'image/gif', 'image/jpeg'] }
  belongs_to :artists
  belongs_to :events
  belongs_to :news
  belongs_to :videos
end
