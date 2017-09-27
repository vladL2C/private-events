class Event < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true 
	belongs_to :creator, :class_name => "User"
	has_many :attendances
	has_many :users, through: :attendances

	default_scope -> { order(created_at: :desc) }

	scope :past, -> created_at { where("created_at < ?",Time.zone.now) }
	scope :upcoming, -> created_at { where("created_at > ?", Time.zone.now) }
end
