require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

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
		puts "er.."
	end

end
