class About < ActiveRecord::Base
  active_admin_translates :short_about, :long_about
  has_attached_file :cover, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :high => '1920x1080>' },
              :url  => "/assets/abouts/:id/:style/:basename.:extension",
              :path => ":rails_root/public/assets/abouts/:id/:style/:basename.:extension"
   validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
