class User < ActiveRecord::Base
	has_many :tracks
	has_many :likes
	has_many :reviews
	validates :username, presence: true
	validates :email, presence: true
	validates :password, presence: true, uniqueness: true
end