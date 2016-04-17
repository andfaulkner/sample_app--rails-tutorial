class UsersController < ApplicationController

	def show
		@user = User.find params[:id]
	end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save 		  	#if save was successful
  		puts "new user created!"
  		# render 'show'
  		puts "id"=>12, "action"=>params[:action]
  		flash[:success] = "New user successfully created! Welcome #{@user[:name]}!"
      redirect_to @user
      # redirect_to @user
  	else 									#if save was unsuccessful
  		puts "user creation failed :("
  		puts "errors: #{@user.errors.full_messages}"
  		flash[:danger] = "Failed to create new user, see error message"
  		render 'new'
  	end
  end

end
