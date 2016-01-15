class Event < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true

	has_many :event_artists, :dependent => :destroy
	has_many :artists, :through => :event_artists

	belongs_to :year

	extend FriendlyId
	friendly_id :name, use: :slugged

	validates :name, presence: true
	validates :name, uniqueness: true
end
