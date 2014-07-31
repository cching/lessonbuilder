require "spec_helper"

describe XaquestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/xaquestions").should route_to("xaquestions#index")
    end

    it "routes to #new" do
      get("/xaquestions/new").should route_to("xaquestions#new")
    end

    it "routes to #show" do
      get("/xaquestions/1").should route_to("xaquestions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/xaquestions/1/edit").should route_to("xaquestions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/xaquestions").should route_to("xaquestions#create")
    end

    it "routes to #update" do
      put("/xaquestions/1").should route_to("xaquestions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/xaquestions/1").should route_to("xaquestions#destroy", :id => "1")
    end

  end
end
