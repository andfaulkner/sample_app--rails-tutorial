require 'rails_helper'

RSpec.describe "bears/index", :type => :view do
  before(:each) do
    assign(:bears, [
      Bear.create!(
        :name => "Name",
        :type => "Type",
        :home => "Home",
        :age => 1,
        :password_digest => "Password Digest"
      ),
      Bear.create!(
        :name => "Name",
        :type => "Type",
        :home => "Home",
        :age => 1,
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of bears" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Home".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
end
