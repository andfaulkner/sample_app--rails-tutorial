module SessionsHelper

	# logs out the current user
	def logout
		session.delete(:user_id)
		@current_user = nil
	end

  # Try to log in. User must have provided a password & email for this to work
	def attempt_login
  	get_login_attempt_content
  	if authentication_attempt == 'success'
			log_in
  	else
  		show_login_fail_msg
  	end
	end

	# get current user. Ensure db only gets hit 1X if current_user called more than 1X on a page
	def current_user
	  @current_user ||= User.where(id: session[:user_id]).first
	end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

	private

		def get_login_attempt_content
			@password, @email = 	params[:session][:password],
														params[:session][:email]
			@user_page = @user = 	(User.where email: @email).first
		end

		def authentication_attempt
			(@user && (@user.authenticate @password)) ? 'success' : 'fail'
		end

		def show_login_fail_msg
	  	flash.now[:danger] = 'Invalid email/password combo'
	  	render 'new'
		end
		
		# 
		# if authentication succeeds create a user session & redirect user to their profile (user) page
		# 
		def log_in
			# binding.pry
			session[:user_id] = @user.id   # this creates temporary cookies, which are encrypted
			redirect_to @user_page
		end

end
