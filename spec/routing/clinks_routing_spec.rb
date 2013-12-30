require "spec_helper"

describe ClinksController do
  describe "routing" do

    it "routes to #index" do
      get("/clinks").should route_to("clinks#index")
    end

    it "routes to #new" do
      get("/clinks/new").should route_to("clinks#new")
    end

    it "routes to #show" do
      get("/clinks/1").should route_to("clinks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/clinks/1/edit").should route_to("clinks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/clinks").should route_to("clinks#create")
    end

    it "routes to #update" do
      put("/clinks/1").should route_to("clinks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clinks/1").should route_to("clinks#destroy", :id => "1")
    end

  end
end
