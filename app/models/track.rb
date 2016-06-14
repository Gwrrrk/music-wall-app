class Track < ActiveRecord::Base
	belongs_to :user
	has_many :likes
	validates :song_title, presence: true
	validates :author, presence: true 

	def like_count
		self.likes.count
	end
end