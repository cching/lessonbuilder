require "spec_helper"

describe SelectsController do
  describe "routing" do

    it "routes to #index" do
      get("/selects").should route_to("selects#index")
    end

    it "routes to #new" do
      get("/selects/new").should route_to("selects#new")
    end

    it "routes to #show" do
      get("/selects/1").should route_to("selects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/selects/1/edit").should route_to("selects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/selects").should route_to("selects#create")
    end

    it "routes to #update" do
      put("/selects/1").should route_to("selects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/selects/1").should route_to("selects#destroy", :id => "1")
    end

  end
end
