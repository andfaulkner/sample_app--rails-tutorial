require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
		assert_template 'users/new' # ensure root path is rendered w/ the given view / template

    assert_select "body > div > h1:first-child", "Sign up"
    assert_select "title", full_title("Sign up") #recap: full_title appends '| Sample app' for you
		assert_select "a[href=?]", help_path # test for presence of help_path in an a href tag
		assert_select "a[href=?]", about_path
		assert_select "a[href=?]", contact_path
		assert_select "a[href=?]", root_path, count: 2 #link to root_path should be present X2 
  end

end
