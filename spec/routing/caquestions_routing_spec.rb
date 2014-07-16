require "spec_helper"

describe CaquestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/caquestions").should route_to("caquestions#index")
    end

    it "routes to #new" do
      get("/caquestions/new").should route_to("caquestions#new")
    end

    it "routes to #show" do
      get("/caquestions/1").should route_to("caquestions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/caquestions/1/edit").should route_to("caquestions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/caquestions").should route_to("caquestions#create")
    end

    it "routes to #update" do
      put("/caquestions/1").should route_to("caquestions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/caquestions/1").should route_to("caquestions#destroy", :id => "1")
    end

  end
end
