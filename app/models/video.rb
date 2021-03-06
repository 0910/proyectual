class Video < ActiveRecord::Base
	belongs_to :video_category

	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true

	extend FriendlyId
	friendly_id :name, use: :slugged

	validates :name, presence: true
	validates :name, uniqueness: true
end
