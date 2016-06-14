class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :track
	validates :text, presence: true
	validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 5}
end