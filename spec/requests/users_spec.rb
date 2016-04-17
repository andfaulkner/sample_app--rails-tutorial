require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "GET /users/new" do
    it "GET request to /users/new path responds with 200 status" do
      get '/users/new'
      expect(response).to have_http_status(200)
    end
    it "POST request to /users/new path responds with 200 status" do
      post '/users/new' => {
      	"user" => { "user"=>"testuser1", 
										"email"=>"testuser1email@example.com",
										"password"=>"testpassword",
										"password_confirmation"=>"testpassword"
				},
				"commit"=>"Create my account"
			}
      # get '/users/new'
      expect(response).to have_http_status(200)
    end
  end
end
