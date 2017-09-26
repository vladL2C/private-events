class SessionsController < ApplicationController

	def new
	end 

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && @user.authenticate(params[:session][:password])
			log_in(@user)
			params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
			flash[:success] = "Oh shnap 1-900 linden logged in"
			redirect_to root_url
		else 
			flash.now[:danger] = "Oh shnap Invalid email/password combination"
			render 'new'
		end 	
	end

	def destroy
		log_out if logged_in?
		flash[:success] = "Oh Shnap you just logged out"
		redirect_to root_url 
	end  

end
