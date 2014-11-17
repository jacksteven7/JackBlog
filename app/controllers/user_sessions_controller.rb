class UserSessionsController < ApplicationController
	def new
		@user = User.new		
	end
	def create
		if @user = login(params[:username],params[:password])
			redirect_back_or_to(posts_path,message:"Login Successful")
		else
			flash.now[:alert] = "Something is wrong"
			render action: :new
		end
	end
	def destroy
		logout
		redirect_to( :users, message: "Logged Out")
	end

end
