class Artist < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true

	has_many :event_artists, :dependent => :destroy
	has_many :events, :through => :event_artists

	extend FriendlyId
	friendly_id :name, use: :slugged
	
	validates :name, presence: true
	validates :name, uniqueness: true

end
