class News < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true

  active_admin_translates :title, :body

	extend FriendlyId
	friendly_id :title, use: :slugged

	validates :title, presence: true
	validates :title, uniqueness: true
end
