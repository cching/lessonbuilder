require "spec_helper"

describe SelectAquestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/select_aquestions").should route_to("select_aquestions#index")
    end

    it "routes to #new" do
      get("/select_aquestions/new").should route_to("select_aquestions#new")
    end

    it "routes to #show" do
      get("/select_aquestions/1").should route_to("select_aquestions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/select_aquestions/1/edit").should route_to("select_aquestions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/select_aquestions").should route_to("select_aquestions#create")
    end

    it "routes to #update" do
      put("/select_aquestions/1").should route_to("select_aquestions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/select_aquestions/1").should route_to("select_aquestions#destroy", :id => "1")
    end

  end
end
