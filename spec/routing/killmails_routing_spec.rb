require "rails_helper"

RSpec.describe KillmailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/killmails").to route_to("killmails#index")
    end

    it "routes to #new" do
      expect(:get => "/killmails/new").to route_to("killmails#new")
    end

    it "routes to #show" do
      expect(:get => "/killmails/1").to route_to("killmails#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/killmails/1/edit").to route_to("killmails#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/killmails").to route_to("killmails#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/killmails/1").to route_to("killmails#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/killmails/1").to route_to("killmails#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/killmails/1").to route_to("killmails#destroy", :id => "1")
    end

  end
end
