require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "layout_links" do
		p root_path
		get root_path
		assert_template 'static_pages/home' # ensure root path is rendered w/ the given view / template
		assert_select "a[href=?]", help_path # test for presence of help_path in an a href tag
		assert_select "a[href=?]", about_path
		assert_select "a[href=?]", contact_path
		assert_select "a[href=?]", root_path, count: 2 #link to root_path should be present X2 
	end
  # test "the truth" do
  #   assert true
  # end
end
