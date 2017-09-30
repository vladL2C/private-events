class EventsController < ApplicationController
	before_action :logged_in_user, only: [:new, :index]
	has_scope :past
	has_scope :upcoming

	def index
		@events = apply_scopes(Event).all
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

	def show
		@event = Event.find(params[:id])
		@attends = @event.attendances 
	end
 
	private

	def event_params
		params.require(:event).permit(:title, :body, :event_date)
	end 
end
