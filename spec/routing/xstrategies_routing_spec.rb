require "spec_helper"

describe XstrategiesController do
  describe "routing" do

    it "routes to #index" do
      get("/xstrategies").should route_to("xstrategies#index")
    end

    it "routes to #new" do
      get("/xstrategies/new").should route_to("xstrategies#new")
    end

    it "routes to #show" do
      get("/xstrategies/1").should route_to("xstrategies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/xstrategies/1/edit").should route_to("xstrategies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/xstrategies").should route_to("xstrategies#create")
    end

    it "routes to #update" do
      put("/xstrategies/1").should route_to("xstrategies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/xstrategies/1").should route_to("xstrategies#destroy", :id => "1")
    end

  end
end
