class Splash < ActiveRecord::Base
	has_attached_file :image, :styles => { :thumb => '210x126>', :small => '420x252>', :medium => '840x504>', :large => '1440x864>' },
						:url  => "/assets/splashes/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/splashes/:id/:style/:basename.:extension"
						
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  active_admin_translates :title, :subtitle, :call_to_action
end
