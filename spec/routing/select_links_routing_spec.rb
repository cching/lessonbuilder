require "spec_helper"

describe SelectLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/select_links").should route_to("select_links#index")
    end

    it "routes to #new" do
      get("/select_links/new").should route_to("select_links#new")
    end

    it "routes to #show" do
      get("/select_links/1").should route_to("select_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/select_links/1/edit").should route_to("select_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/select_links").should route_to("select_links#create")
    end

    it "routes to #update" do
      put("/select_links/1").should route_to("select_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/select_links/1").should route_to("select_links#destroy", :id => "1")
    end

  end
end
