module SessionsHelper

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
