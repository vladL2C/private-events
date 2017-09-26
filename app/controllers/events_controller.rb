class EventsController < ApplicationController
	before_action :logged_in_user

	def new
		@event = current_user.created_events.build
	end 

	def create
	end 
end
