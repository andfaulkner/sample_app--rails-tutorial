require 'rails_helper'

RSpec.describe "bears/show", :type => :view do
  before(:each) do
    @bear = assign(:bear, Bear.create!(
      :name => "Name",
      :type => "Type",
      :home => "Home",
      :age => 1,
      :password_digest => "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Home/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Password Digest/)
  end
end
