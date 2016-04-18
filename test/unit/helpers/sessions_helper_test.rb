require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

	test 'log_in: ensure it accepts either [User] or User. Ensure session # assignment working' do
		user = User.new("name"=>"Meekamoo", "email"=>"meekamoo@gmail.com",
						 "password"=>"111222", "password_confirmation"=>"111222")
		user.save
		log_in user
		assert (session == {"user_id"=>1})

		User.create("name"=>"Meekamoo2", "email"=>"meekamoo2@gmail.com",
						 "password"=>"1112223", "password_confirmation"=>"1112223")
		user2 = User.where(email: "meekamoo2@gmail.com")
		log_in user2
		assert (session == {"user_id"=>2})
	end
end
