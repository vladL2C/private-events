class Event < ApplicationRecord
	validates :title
	validates :body 
	belongs_to :creator, :class_name => "User"
	has_many :attendances
	has_many :users, through: :attendances

	default_scope -> { order(created_at: :desc) }

	scope :past, ->{ where("created_at < ?",Time.zone.now) }
	scope :upcoming, ->{ where("created_at > ?", Time.zone.now) }
end
