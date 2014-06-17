require "spec_helper"

describe HeadersController do
  describe "routing" do

    it "routes to #index" do
      get("/headers").should route_to("headers#index")
    end

    it "routes to #new" do
      get("/headers/new").should route_to("headers#new")
    end

    it "routes to #show" do
      get("/headers/1").should route_to("headers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/headers/1/edit").should route_to("headers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/headers").should route_to("headers#create")
    end

    it "routes to #update" do
      put("/headers/1").should route_to("headers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/headers/1").should route_to("headers#destroy", :id => "1")
    end

  end
end
