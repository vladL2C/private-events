class EventsController < ApplicationController
	before_action :logged_in_user

	def index

	end 

	def new
		@event = current_user.created_events.build
	end 

	def create
		@event = current_user.created_events.build(event_params)
		if @event.save
			flash[:success] = " oh shnap event created!"
			redirect_to events_path 
		else 
			render 'new'
		end 	
	end 

	private

	def event_params
		params.require(:event).permit(:title, :body)
	end 
end
