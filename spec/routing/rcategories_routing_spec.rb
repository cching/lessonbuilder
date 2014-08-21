require "spec_helper"

describe RcategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/rcategories").should route_to("rcategories#index")
    end

    it "routes to #new" do
      get("/rcategories/new").should route_to("rcategories#new")
    end

    it "routes to #show" do
      get("/rcategories/1").should route_to("rcategories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rcategories/1/edit").should route_to("rcategories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rcategories").should route_to("rcategories#create")
    end

    it "routes to #update" do
      put("/rcategories/1").should route_to("rcategories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rcategories/1").should route_to("rcategories#destroy", :id => "1")
    end

  end
end
