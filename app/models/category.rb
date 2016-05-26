class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]
	has_and_belongs_to_many :videos
	validates :name, presence: true
end
