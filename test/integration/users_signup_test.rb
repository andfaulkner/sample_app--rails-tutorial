require 'test_helper'

class UsersSignuptest < ActionDispatch::IntegrationTest

	test "Invalid signup info should prevent user from being created & return user to 'new' page" do
    assert_no_difference 'User.count' do
		  post users_path, user: { name:  								"hello",
	                          	 email: 								"user@invalid.com",
	                          	 password:              "fooooo",
	                          	 password_confirmation: "faa" }
		end
    assert_no_difference 'User.count' do
		  post users_path, user: { name:  								"hello",
	                          	 email: 								"@invalid.com",
	                          	 password:              "fooooo",
	                          	 password_confirmation: "fooooo" }
		end
    assert_no_difference 'User.count' do
		  post users_path, user: { name:  								"asdfasdfasdf",
	                          	 email: 								"user@invalid.com",
	                          	 password:              "f",
	                          	 password_confirmation: "f" }
		end
    assert_no_difference 'User.count' do
		  post users_path, user: { name:  								"hello",
	                          	 email: 								"user@invalid.com",
	                          	 password:              "fooooo",
	                          	 password_confirmation: "faa" }
		end
		assert_template 'users/new' # ensure signup path is rendered w/ the given template
	end

	test "Valid signup information should create a user & display new user's info" do
    assert_difference 'User.count', +1, 'A user should be created with the given params' do
		  post_via_redirect users_path, user: { name:  								"hello",
							                          	 email: 								"user@valid.com",
							                          	 password:              "fooooo",
							                          	 password_confirmation: "fooooo" }
		end
		assert_template 'users/show'
	end

	test 'valid signup information' do
		get signup_path
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: { :name=>'Example User',
																						:email=>'user@example.com',
																						:password=>"password",
																						:password_confirmation=>"password"	}
		end
		assert_template 'users/show'
		assert is_logged_in?
	end

  # test "the truth" do
  #   assert true
  # end
end
