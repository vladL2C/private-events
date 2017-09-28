class AttendeesController < ApplicationController

	def create
		@event = Event.find(params[:attendance][:event_id])
		@attend = current_user.attendances.create(event_id: @event.id)
		flash[:success] = "You Joined Successfully"
		redirect_back(fallback_location: events_path(@event))
	end 

end
