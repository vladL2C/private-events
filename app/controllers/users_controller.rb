class UsersController < ApplicationController

	def new
		@user = User.new
	end 

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Oh shnap you just signed up"
			redirect_to root_url
		else 
			render 'new'
		end 
	end

	def my_events

	end  

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end 

end
