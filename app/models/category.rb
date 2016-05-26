class Category < ActiveRecord::Base
	has_and_belongs_to_many :videos
	validates :name, presence: true
end
