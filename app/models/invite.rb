class Invite < ApplicationRecord
	belongs_to :event 
	belongs_to :invitor, :class_name => "User"
	belongs_to :invitee, :class_name => "User"
end
