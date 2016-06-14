class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :track
	validates :text, presence: true
end