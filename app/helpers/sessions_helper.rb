module SessionsHelper

	def attempt_login
  	get_login_attempt_content
  	if authentication_attempt == 'success'
			log_in
  	else
  		show_login_fail_msg
  	end
	end

	def current_user
	  User.find_by(id: session[:user_id])
	end

	private

		def get_login_attempt_content
			@password, @email = 	params[:session][:password],
														params[:session][:email]
			@user_page = @user = 	(User.where email: @email)[0]
		end

		def authentication_attempt
			(@user && (@user.authenticate @password)) ? 'success' : 'fail'
		end

		def show_login_fail_msg
	  	flash.now[:danger] = 'Invalid email/password combo'
	  	render 'new'
		end
		
		# create a user session if authentication succeeds, redirect to user page
		def log_in
			session[:user_id] = @user.id   # this creates temporary cookies, which are encrypted
			redirect_to @user_page
		end

end
