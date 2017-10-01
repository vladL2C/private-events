class UsersController < ApplicationController
	has_scope :past 
	has_scope :upcoming

	def new
		@user = User.new
	end 

	def create
		@user = User.new(user_params)
		if @user.save
			log_in(@user)
			flash[:success] = "Oh shnap you just signed up"
			redirect_to root_url
		else 
			render 'new'
		end 
	end

	def my_events
		@events = apply_scopes(current_user.events)
	end  

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end 

end
