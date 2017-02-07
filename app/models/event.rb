class Event < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true

	has_many :event_artists, :dependent => :destroy
	has_many :artists, :through => :event_artists

  has_and_belongs_to_many(:events,
    :join_table => "event_connections",
    :foreign_key => "event_a_id",
    :association_foreign_key => "event_b_id")

   has_attached_file :video_cover, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :high => '1920x1080>' },
              :url  => "/assets/events/:id/:style/:basename.:extension",
              :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"
   validates_attachment_content_type :video_cover, content_type: /\Aimage\/.*\Z/

	belongs_to :year

  active_admin_translates :description

	extend FriendlyId
	friendly_id :name, use: :slugged

	validates :name, presence: true
	validates :name, uniqueness: true
end
