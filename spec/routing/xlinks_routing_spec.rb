require "spec_helper"

describe XlinksController do
  describe "routing" do

    it "routes to #index" do
      get("/xlinks").should route_to("xlinks#index")
    end

    it "routes to #new" do
      get("/xlinks/new").should route_to("xlinks#new")
    end

    it "routes to #show" do
      get("/xlinks/1").should route_to("xlinks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/xlinks/1/edit").should route_to("xlinks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/xlinks").should route_to("xlinks#create")
    end

    it "routes to #update" do
      put("/xlinks/1").should route_to("xlinks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/xlinks/1").should route_to("xlinks#destroy", :id => "1")
    end

  end
end
