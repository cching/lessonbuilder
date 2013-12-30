require "spec_helper"

describe CstrategiesController do
  describe "routing" do

    it "routes to #index" do
      get("/cstrategies").should route_to("cstrategies#index")
    end

    it "routes to #new" do
      get("/cstrategies/new").should route_to("cstrategies#new")
    end

    it "routes to #show" do
      get("/cstrategies/1").should route_to("cstrategies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cstrategies/1/edit").should route_to("cstrategies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cstrategies").should route_to("cstrategies#create")
    end

    it "routes to #update" do
      put("/cstrategies/1").should route_to("cstrategies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cstrategies/1").should route_to("cstrategies#destroy", :id => "1")
    end

  end
end
