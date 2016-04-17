require 'rails_helper'

RSpec.describe "UsersSignups", :type => :request do

  # describe "GET /users" do
  #   it "works! (now write some real specs)" do
  #     get users_signups_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

  describe "Create new user" do
    it "Successfully create a new user with a name, email, and password" do
      post '/users/new' => {
      	"user" => { "user"=>"testuser1", 
										"email"=>"testuser1email@example.com",
										"password"=>"testpassword",
										"password_confirmation"=>"testpassword"
				},
				"commit"=>"Create my account"
			}
      expect(response).to have_http_status(200)
    end
  end

end
