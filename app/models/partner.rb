class Partner < ActiveRecord::Base
  has_attached_file :logo, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :high => '1920x1080>' },
              :url  => "/assets/partners/:id/:style/:basename.:extension",
              :path => ":rails_root/public/assets/partners/:id/:style/:basename.:extension"
   validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
