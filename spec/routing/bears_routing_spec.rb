require "rails_helper"

RSpec.describe BearsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bears").to route_to("bears#index")
    end

    it "routes to #new" do
      expect(:get => "/bears/new").to route_to("bears#new")
    end

    it "routes to #show" do
      expect(:get => "/bears/1").to route_to("bears#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bears/1/edit").to route_to("bears#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bears").to route_to("bears#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bears/1").to route_to("bears#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bears/1").to route_to("bears#destroy", :id => "1")
    end

  end
end
