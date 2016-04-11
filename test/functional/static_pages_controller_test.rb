require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

	# ensure if we send a request to [root]/static_pages/home that response has a 200 status code
  test "should get home" do
    get :home 										# makes a get request to the home (/home) action in /static_pages 
    assert_response :success  		# :success is a representation of a 200 OK HTTP status code
    assert_select "title", "Home" # selects matching HTML tag, checks that contents matches 2nd arg ("Home")
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help"
  end

  test "should get about" do
  	get :about
  	assert_response :success
    assert_select "title", "About"
  end

end
