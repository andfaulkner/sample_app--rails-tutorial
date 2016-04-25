require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest


	def setup
		@user = users :meeka
	end

	test "ensure login with invalid information fails & that flash doesn't persist after fail" do
		get login_path
		assert_template 'sessions/new'
		# attempt login
		post login_path, session: { email: "", password: "" }
		assert_template 'sessions/new'	# ensure same template is present after login attempt
		assert ! flash.empty?					# ensure flash is present after failed login attempt
		puts flash
		get root_path										# visit a new path - say, the root
		assert flash.empty?							# flash should now be empty after visiting the new location
	end

	test "ensure login with valid information succeeds & that flash doesn't persist after fail" do
		get login_path
		post login_path, session: { email: @user.email, password: 'password' }
		# what it sounds like
		assert is_logged_in?
		# check the right redirect target
		assert_redirected_to @user
		# actually visit target page
		follow_redirect!
		# did it render with the right target?
		assert_template 'users/show'
		assert_select "a[href=?]", login_path, count: 0
		assert_select "a[href=?]", logout_path
		assert_select "a[href=?]", user_path(@user)
		delete logout_path
		assert_select "a[href=?]", login_path
		assert_select "a[href=?]", logout_path, count: 0
		assert_select "a[href=?]", user_path(@user), count: 0

	end

end
