class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.where(email: params[:session][:email].downcase)
  	if user && user[0] && user[0].authenticate(params[:session][:password])
  		puts user.inspect
			log_in user, redirect: true
			# redirect_to user[0]
  	else
  		flash.now[:danger] = 'Invalid email/password combo'
  		render 'new'
  	end
  end

  def destroy
  end

end
