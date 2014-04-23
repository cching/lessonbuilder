require "spec_helper"

describe AquestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/aquestions").should route_to("aquestions#index")
    end

    it "routes to #new" do
      get("/aquestions/new").should route_to("aquestions#new")
    end

    it "routes to #show" do
      get("/aquestions/1").should route_to("aquestions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aquestions/1/edit").should route_to("aquestions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aquestions").should route_to("aquestions#create")
    end

    it "routes to #update" do
      put("/aquestions/1").should route_to("aquestions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aquestions/1").should route_to("aquestions#destroy", :id => "1")
    end

  end
end
