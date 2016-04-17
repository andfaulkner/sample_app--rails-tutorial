require 'rails_helper'

RSpec.describe "Bears", :type => :request do
  describe "GET /bears" do
    it "works! (now write some real specs)" do
      get bears_path
      expect(response).to have_http_status(200)
    end
  end
end
