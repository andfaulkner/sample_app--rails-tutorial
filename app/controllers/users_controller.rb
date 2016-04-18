class UsersController < ApplicationController

	def show
		@user = User.find params[:id]
	end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
		#if save was successful::
  	if @user.save
  		# render 'show'	#<< this would also display show user page, by running the show action above
      redirect_to @user, flash: { success: "User successfully created! Welcome #{@user[:name]}!" }
      # could also do it like this:
	  		# flash[:success] = "New user successfully created! Welcome #{@user[:name]}!"
	      # redirect_to @user
		#if save was unsuccessful::
  	else
  		flash[:danger] = "Failed to create new user, see error message"
  		render 'new'
  	end
  end

end
