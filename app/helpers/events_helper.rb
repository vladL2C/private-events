module EventsHelper

	def attending_event?
		attending = false 
		@attends.each do |attend|
			if attend.user == current_user
				attending = true 
			end
		end
		return attending 
	end 

end
