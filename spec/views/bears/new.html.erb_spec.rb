require 'rails_helper'

RSpec.describe "bears/new", :type => :view do
  before(:each) do
    assign(:bear, Bear.new(
      :name => "MyString",
      :type => "",
      :home => "MyString",
      :age => 1,
      :password_digest => "MyString"
    ))
  end

  it "renders new bear form" do
    render

    assert_select "form[action=?][method=?]", bears_path, "post" do

      assert_select "input#bear_name[name=?]", "bear[name]"

      assert_select "input#bear_type[name=?]", "bear[type]"

      assert_select "input#bear_home[name=?]", "bear[home]"

      assert_select "input#bear_age[name=?]", "bear[age]"

      assert_select "input#bear_password_digest[name=?]", "bear[password_digest]"
    end
  end
end
