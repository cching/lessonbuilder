require "spec_helper"

describe GoogleFormsController do
  describe "routing" do

    it "routes to #index" do
      get("/google_forms").should route_to("google_forms#index")
    end

    it "routes to #new" do
      get("/google_forms/new").should route_to("google_forms#new")
    end

    it "routes to #show" do
      get("/google_forms/1").should route_to("google_forms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/google_forms/1/edit").should route_to("google_forms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/google_forms").should route_to("google_forms#create")
    end

    it "routes to #update" do
      put("/google_forms/1").should route_to("google_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/google_forms/1").should route_to("google_forms#destroy", :id => "1")
    end

  end
end
