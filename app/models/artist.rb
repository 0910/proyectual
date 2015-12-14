class Artist < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true
	extend FriendlyId
	friendly_id :slug, use: :slugged
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :slug, presence: true
	validates :slug, uniqueness: true
end
