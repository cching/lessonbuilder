require "spec_helper"

describe CskillsController do
  describe "routing" do

    it "routes to #index" do
      get("/cskills").should route_to("cskills#index")
    end

    it "routes to #new" do
      get("/cskills/new").should route_to("cskills#new")
    end

    it "routes to #show" do
      get("/cskills/1").should route_to("cskills#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cskills/1/edit").should route_to("cskills#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cskills").should route_to("cskills#create")
    end

    it "routes to #update" do
      put("/cskills/1").should route_to("cskills#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cskills/1").should route_to("cskills#destroy", :id => "1")
    end

  end
end
