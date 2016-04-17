require 'rails_helper'

RSpec.describe "bears/edit", :type => :view do
  before(:each) do
    @bear = assign(:bear, Bear.create!(
      :name => "MyString",
      :type => "",
      :home => "MyString",
      :age => 1,
      :password_digest => "MyString"
    ))
  end

  it "renders the edit bear form" do
    render

    assert_select "form[action=?][method=?]", bear_path(@bear), "post" do

      assert_select "input#bear_name[name=?]", "bear[name]"

      assert_select "input#bear_type[name=?]", "bear[type]"

      assert_select "input#bear_home[name=?]", "bear[home]"

      assert_select "input#bear_age[name=?]", "bear[age]"

      assert_select "input#bear_password_digest[name=?]", "bear[password_digest]"
    end
  end
end
