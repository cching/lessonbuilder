require "spec_helper"

describe XskillsController do
  describe "routing" do

    it "routes to #index" do
      get("/xskills").should route_to("xskills#index")
    end

    it "routes to #new" do
      get("/xskills/new").should route_to("xskills#new")
    end

    it "routes to #show" do
      get("/xskills/1").should route_to("xskills#show", :id => "1")
    end

    it "routes to #edit" do
      get("/xskills/1/edit").should route_to("xskills#edit", :id => "1")
    end

    it "routes to #create" do
      post("/xskills").should route_to("xskills#create")
    end

    it "routes to #update" do
      put("/xskills/1").should route_to("xskills#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/xskills/1").should route_to("xskills#destroy", :id => "1")
    end

  end
end
