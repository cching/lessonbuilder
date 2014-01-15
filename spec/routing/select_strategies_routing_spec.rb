require "spec_helper"

describe SelectStrategiesController do
  describe "routing" do

    it "routes to #index" do
      get("/select_strategies").should route_to("select_strategies#index")
    end

    it "routes to #new" do
      get("/select_strategies/new").should route_to("select_strategies#new")
    end

    it "routes to #show" do
      get("/select_strategies/1").should route_to("select_strategies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/select_strategies/1/edit").should route_to("select_strategies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/select_strategies").should route_to("select_strategies#create")
    end

    it "routes to #update" do
      put("/select_strategies/1").should route_to("select_strategies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/select_strategies/1").should route_to("select_strategies#destroy", :id => "1")
    end

  end
end
