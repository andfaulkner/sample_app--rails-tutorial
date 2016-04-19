module SessionsHelper

	def authenticate (opts)
  	user = User.where(email: params[:session][:email].downcase)
  	if user && user[0] && user[0].authenticate(params[:session][:password])
			log_in user, redirect: true
  	else
  		opts.fetch(:error).call
  	end
	end

	def show_login_fail_msg
  	flash.now[:danger] = 'Invalid email/password combo'
  	render 'new'
	end
	
	#
	# create a user session if authentication succeeds
	#
	def log_in user, opts = {redirect: false}
		@user = (defined? user.size) ? user[0] : user
		session[:user_id] = @user.id   # this creates temporary cookies, which are encrypted
		redirect_post_login opts
	end

	def current_user
	  User.find_by(id: session[:user_id])
	end

	def redirect_post_login opts = {redirect: false}
		redirect = opts.fetch(:redirect)
		if redirect == true
			redirect_to @user
		elsif redirect
			redirect_to redirect
		end
	end

end
