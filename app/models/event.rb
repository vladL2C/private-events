class Event < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true 
	belongs_to :creator, :class_name => "User"
	has_many :attendances
	has_many :users, through: :attendances


	default_scope -> { order(created_at: :desc) }

	scope :past, -> event_date { where("event_date < ?",Time.zone.now) }
	scope :upcoming, -> event_date { where("event_date > ?", Time.zone.now) }



end
