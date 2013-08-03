class SessionsController < ApplicationController

	def new
		#render 'new'
	end

	def create
  	user = User.find_by_email(params[:session][:email])


  	if user && user.authenticate(params[:session][:password])

      sign_in user
      #redirect_back_or user
  		redirect_back_or user
  	else
  		#render 'new'
  		flash.now[:error] = "Invalid email/password combination"
  		render 'new'
  	end
  end
	
	def destroy
    sign_out
    redirect_to '/' #'static_pages'
	end	
end
